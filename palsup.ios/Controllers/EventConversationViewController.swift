//
//  EventConversationViewController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 11/10/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit
import MessageKit
import InputBarAccessoryView
import SwiftDate
import Promises

class EventMessage : MessageKit.MessageType {
  init(message: GetEventConversationQuery.Data.GetEventConversation.Group.Conversation?) {
    let sender = Sender(id: message?.from?.id ?? "N/A", displayName: message?.from?.name.fragments.nameFields.first ?? "N/A")
    self.sender = sender
    /*ToDO: add date to API return values and use the actual date from server Date(milliseconds: Int(message?.date)*/
    self.sentDate = Date()
    self.kind = .text(message?.content?.text ?? " ")
    self.messageId = message?.id ?? UUID().uuidString
    self.status = DeliveryStatus.recieved
  }
  
  init (sender:SenderType, messageId:String, date:Date, kind:MessageKind, status:DeliveryStatus) {
    self.sender = sender
    self.sentDate = date
    self.kind = kind
    self.messageId = messageId
    self.status = status
  }
  
  var sender: SenderType
  var messageId: String
  var sentDate: Date
  var kind: MessageKind
  var status:DeliveryStatus
  
  enum DeliveryStatus {
    case recieved
    case sent
    case delivered
    case failed
  }
}

class EventConversationViewController: MessagesViewController {
  var event: Event?
  
  var messages: [EventMessage] = [] {
    didSet {
      self.messagesCollectionView.reloadData()
    }
  }
  
  let refreshControl = UIRefreshControl()
  
  let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureMessageCollectionView()
    configureMessageInputBar()
    // ToDO: improvement! load all the old messages when the view first loads. Then in viewDidAppear only load the new messages that are not already loaded in self.messages. Might need API changes to only fetch new messages after a specific time.
    title = event?.activity ?? "Events"
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    // fetch event conversations
    if let eventId = event?.id {
      let gqlGetEventConversationQuery = GetEventConversationQuery(eventId: eventId)
      GqlClient.shared.client.fetch(query: gqlGetEventConversationQuery) { 
        result in
        switch result {
        case .success(let gqlResult):
          if let messages = gqlResult.data?.getEventConversation?.group.conversation {
            let eventMessages : [EventMessage] = messages.map({EventMessage(message: $0)})
            self.messages = eventMessages
          }
        case .failure(let error):
          print(error)
        }
      }
    }
  }
  
  func configureMessageCollectionView() {
    
    messagesCollectionView.messagesDataSource = self
    messagesCollectionView.messageCellDelegate = self
    messagesCollectionView.messagesLayoutDelegate = self
    messagesCollectionView.messagesDisplayDelegate = self
    
    scrollsToBottomOnKeyboardBeginsEditing = true // default false
    maintainPositionOnKeyboardFrameChanged = true // default false
    
    messagesCollectionView.addSubview(refreshControl)
    refreshControl.addTarget(self, action: #selector(loadMoreMessages), for: .valueChanged)
  }
  
  func configureMessageInputBar() {
    messageInputBar.delegate = self
    messageInputBar.inputTextView.tintColor = .primaryColor
    messageInputBar.sendButton.setTitleColor(.primaryColor, for: .normal)
    messageInputBar.sendButton.setTitleColor(
      UIColor.primaryColor.withAlphaComponent(0.3),
      for: .highlighted
    )
  }
  
  @objc
  func loadMoreMessages() {
    /*DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 1) {
       SampleData.shared.getMessages(count: 20) { messages in
         DispatchQueue.main.async {
           self.messageList.insert(contentsOf: messages, at: 0)
           self.messagesCollectionView.reloadDataAndKeepOffset()
           self.refreshControl.endRefreshing()
         }
       }
     }*/
  }
  
  private func insertMessages(_ data: [Any]) {
    /*for component in data {
     let user = SampleData.shared.currentSender
     if let str = component as? String {
     let message = MockMessage(text: str, user: user, messageId: UUID().uuidString, date: Date())
     insertMessage(message)
     } else if let img = component as? UIImage {
     let message = MockMessage(image: img, user: user, messageId: UUID().uuidString, date: Date())
     insertMessage(message)
     }
     }*/
  }
  
  // MARK: - Helpers
  
  func isTimeLabelVisible(at indexPath: IndexPath) -> Bool {
    return indexPath.section % 3 == 0 && !isPreviousMessageSameSender(at: indexPath)
  }
  
  func isPreviousMessageSameSender(at indexPath: IndexPath) -> Bool {
    guard indexPath.section - 1 >= 0 else { return false }
    return self.messages[indexPath.section].sender.senderId == self.messages[indexPath.section - 1].sender.senderId
  }
  
  func isNextMessageSameSender(at indexPath: IndexPath) -> Bool {
    guard indexPath.section + 1 < self.messages.count else { return false }
    return self.messages[indexPath.section].sender.senderId == self.messages[indexPath.section + 1].sender.senderId
  }
}

// MARK: - MessagesDataSource
extension EventConversationViewController: MessagesDataSource {

  func currentSender() -> SenderType {
    return Sender(id: "5c6383c5ad48667dc5bec1b2", displayName: "Hamid")
  }
  
  func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
    return messages.count
  }
  
  func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageKit.MessageType {
    return messages[indexPath.section]
  }
  
  func messageTopLabelAttributedText(for message: MessageKit.MessageType, at indexPath: IndexPath) -> NSAttributedString? {
    if !isPreviousMessageSameSender(at: indexPath) {
      let name = message.sender.displayName
      return NSAttributedString(string: name, attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption1)])
    }
    return nil
  }
  
  func messageBottomLabelAttributedText(for message: MessageKit.MessageType, at indexPath: IndexPath) -> NSAttributedString? {
    if (!isNextMessageSameSender(at: indexPath)) {
      let dateString = MessageKitDateFormatter.shared.string(from: message.sentDate)
      return NSAttributedString(string: dateString, attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption2)])
    } else {
      return nil
    }
  }
}

// MARK: - MessagesLayoutDelegate
extension EventConversationViewController: MessagesLayoutDelegate {
  
  /*func cellTopLabelHeight(for message: MessageKit.MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
    return 18
  }
  
  func cellBottomLabelHeight(for message: MessageKit.MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
    return 17
  }*/
  
  func messageTopLabelHeight(for message: MessageKit.MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
    return (!isPreviousMessageSameSender(at: indexPath)) && !isFromCurrentSender(message: message) ? 20 : 0
  }
  
  func messageBottomLabelHeight(for message: MessageKit.MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
    return  (!isNextMessageSameSender(at: indexPath)) ? 16 : 0
  }
}

// MARK: - MessageCellDelegate

extension EventConversationViewController: MessageCellDelegate {
  
  func didTapAvatar(in cell: MessageCollectionViewCell) {
    print("Avatar tapped")
  }
  
  func didTapMessage(in cell: MessageCollectionViewCell) {
    print("Message tapped")
  }
  
  func didTapCellTopLabel(in cell: MessageCollectionViewCell) {
    print("Top cell label tapped")
  }
  
  func didTapCellBottomLabel(in cell: MessageCollectionViewCell) {
    print("Bottom cell label tapped")
  }
  
  func didTapMessageTopLabel(in cell: MessageCollectionViewCell) {
    print("Top message label tapped")
  }
  
  func didTapMessageBottomLabel(in cell: MessageCollectionViewCell) {
    print("Bottom label tapped")
  }
  
  func didTapAccessoryView(in cell: MessageCollectionViewCell) {
    print("Accessory view tapped")
  }
  
}

// MARK: - MessageLabelDelegate

extension EventConversationViewController: MessageLabelDelegate {
  
  func didSelectAddress(_ addressComponents: [String: String]) {
    print("Address Selected: \(addressComponents)")
  }
  
  func didSelectDate(_ date: Date) {
    print("Date Selected: \(date)")
  }
  
  func didSelectPhoneNumber(_ phoneNumber: String) {
    print("Phone Number Selected: \(phoneNumber)")
  }
  
  func didSelectURL(_ url: URL) {
    print("URL Selected: \(url)")
  }
  
  func didSelectTransitInformation(_ transitInformation: [String: String]) {
    print("TransitInformation Selected: \(transitInformation)")
  }
  
  func didSelectHashtag(_ hashtag: String) {
    print("Hashtag selected: \(hashtag)")
  }
  
  func didSelectMention(_ mention: String) {
    print("Mention selected: \(mention)")
  }
  
  func didSelectCustom(_ pattern: String, match: String?) {
    print("Custom data detector patter selected: \(pattern)")
  }
  
}

// MARK: - MessageInputBarDelegate

extension EventConversationViewController: InputBarAccessoryViewDelegate {
  
  func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
    guard let to = self.event?.id else {
      // Error: No event is associated with this controller to be able to send the message to
      print("No event is associated with this controller to send the message to")
      return
    }
    
    let components = inputBar.inputTextView.components
    messageInputBar.inputTextView.text = String()
    messageInputBar.invalidatePlugins()
    
    // Send button activity animation
    messageInputBar.sendButton.startAnimating()
    messageInputBar.inputTextView.placeholder = "Sending..."

    
    for component in components {
      if let str = component as? String {
        let sender = currentSender()
        let message = EventMessage(sender: sender, messageId: UUID().uuidString, date: Date(), kind: .text(str), status: .sent)
        self.messages.append(message)
        sendMessage(message: message, to: to).then({messageId in
          if let id = messageId {
            message.messageId = id
            message.status = .delivered
          }
        }).catch({error in
          print(error)
        })
      }
      // ToDO: handle attached images
      /*else if let img = component as? UIImage {
        let message = MockMessage(image: img, user: user, messageId: UUID().uuidString, date: Date())
        insertMessage(message)
      }*/
    }
    
    self.messageInputBar.sendButton.stopAnimating()
    self.messageInputBar.inputTextView.placeholder = "Message"
    self.messagesCollectionView.scrollToBottom(animated: true)

  }
}
  
// MARK: - MessagesDisplayDelegate
extension EventConversationViewController: MessagesDisplayDelegate {
  
  // MARK: - Text Messages
  
  func textColor(for message: MessageKit.MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
    return (isFromCurrentSender(message: message) ? .white : .darkText)
  }
  
  func detectorAttributes(for detector: DetectorType, and message: MessageKit.MessageType, at indexPath: IndexPath) -> [NSAttributedString.Key: Any] {
    switch detector {
    case .hashtag, .mention: return [.foregroundColor: UIColor.blue]
    default: return MessageLabel.defaultAttributes
    }
  }
  
  func enabledDetectors(for message: MessageKit.MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> [DetectorType] {
    return [.url, .address, .phoneNumber, .date, .transitInformation, .mention, .hashtag]
  }
  
  // MARK: - All Messages
  
  func backgroundColor(for message: MessageKit.MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
    return isFromCurrentSender(message: message) ? .primaryColor : UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
  }
  
  func messageStyle(for message: MessageKit.MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageStyle {
    
    var corners: UIRectCorner = []
    
    if isFromCurrentSender(message: message) {
      corners.formUnion(.topLeft)
      corners.formUnion(.bottomLeft)
      if !isPreviousMessageSameSender(at: indexPath) {
        corners.formUnion(.topRight)
      }
      if !isNextMessageSameSender(at: indexPath) {
        corners.formUnion(.bottomRight)
      }
    } else {
      corners.formUnion(.topRight)
      corners.formUnion(.bottomRight)
      if !isPreviousMessageSameSender(at: indexPath) {
        corners.formUnion(.topLeft)
      }
      if !isNextMessageSameSender(at: indexPath) {
        corners.formUnion(.bottomLeft)
      }
    }
    
    return .custom { view in
      let radius: CGFloat = 16
      let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
      let mask = CAShapeLayer()
      mask.path = path.cgPath
      view.layer.mask = mask
    }
  }
  
  func configureAvatarView(_ avatarView: AvatarView, for message: MessageKit.MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
    if !isNextMessageSameSender(at: indexPath) {
      let avatar = Avatar(image: UIImage(named: "46"), initials: "HA")
      avatarView.set(avatar: avatar)
    } else {
      avatarView.isHidden = true
    }
  }
}

// GraphQL API calls
extension EventConversationViewController {
  func sendMessage(message:EventMessage, to:String, type:MessageType = .event) -> Promise<String?> {
    return Promise<String?> { fulfill, reject in
      // Send Message to Server
      switch (message.kind) {
      case .text(let textContent) :
        let messageContent = MessageContentInput(text: textContent)
        let gqlMessage = MessageInput(from: message.sender.senderId, to: to , type: type, content: messageContent)
        let gqlSendMessage = SendMessageMutation(message: gqlMessage)
        GqlClient.shared.client.perform(mutation: gqlSendMessage) { result in
          switch result {
          case .success(let gqlResult):
            fulfill(gqlResult.data?.sendMessage)
          case .failure(let error):
            reject(error)
          }
        }
      default:
        // ToDO: support other message content types such as image, location and such
        reject(GenericErrors("Message content is not supported"))
      }
    }
  }
}


