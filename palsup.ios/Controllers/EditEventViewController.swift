//
//  EditEventViewController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 1/23/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import UIKit
import Eureka
import CropViewController
import Promises
import Kingfisher

class EditEventViewController: FormViewController {
  var event:Event?
  var updateEventCallback: ((Event?)->())?
  
  var imagePickerCrop: ImagePickerCropController?
  
  lazy var eventImageView: UIImageView = {
    var imageView = UIImageView()
    imageView.backgroundColor = UIColor.blue
    imageView.contentMode = .scaleAspectFill
    
    // make it tappable
    imageView.isUserInteractionEnabled = true
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
    imageView.addGestureRecognizer(tapRecognizer)
    
    return imageView
  }()

  lazy var profileImageContainer: UIView = {
    var view:UIView = UIView()
    view.addSubview(self.eventImageView)
    return view
  }()
  
  @objc func openImagePicker() {
    imagePickerCrop?.present(from: eventImageView)
  }
  
  @objc func saveForm() {
    if let event = self.event, let eventId = event.id {
      let values = form.values()
      if let activity = values["title"] as? String {
        
        var eventInput = EventInput()
        eventInput.activity = activity
        eventInput.location??.address = event.location?.address ?? ""
        if let time = values["time"] as? Date {
          let eventTime = time.toFormat("yyyy-MM-dd")
          eventInput.date = DateRangeInput(startDate: eventTime, endDate: eventTime)
        }
        eventInput.description = values["description"] as? String ?? ""
        
        self.updateEvent(id: eventId, event: eventInput).then({event in
          self.event = event
          self.navigationController?.popViewController(animated: true)
        }).catch({error in
          print("error: \(error) happened while signing up the user.")
        })
      }
    }
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    if self.isMovingFromParent {
      // propagate the updated event to the previous ViewController!
      self.updateEventCallback?(self.event)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imagePickerCrop = ImagePickerCropController(presentationController: self, cropDelegate: self)
    setupView()
  }
  
  func setupView() {
    setupForm()
    let save = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveForm))
    self.navigationItem.rightBarButtonItem = save
    setupLayout()
  }
  
  func setupForm() {
    form  +++
        Section() {
          let header = HeaderFooterView<UIView>(.callback({
            return self.profileImageContainer
          }))
          $0.header = header
          $0.header?.height = {100}
        }
        <<< TextRow("title"){ row in
          row.title = "Title"
        }

        <<< DateRow("time"){ row in
          row.title = "Time"
        }
        +++
        Section("Location")
        <<< TextAreaRow("location"){ row in
          row.title = "Location"
        }
        +++
        Section("Description")
        <<< TextAreaRow("description"){ row in
          row.title = "Description"
        }
        <<< ButtonRow() { row in
          row.title = "Reset"
          row.onCellSelection() {cell, row in
            self.resetForm()
          }
        }
    resetForm()
    animateScroll = true
    rowKeyboardSpacing = 20
  }
  
  func resetForm() {
    if let event = self.event {
      var eventDate: Date? = nil
      if let dobMilliSeconds = Int(event.date?.startDate ?? "NIL") {
        eventDate = Date(milliseconds: dobMilliSeconds)
      }
      
      self.form.setValues(["title": event.activity ?? "", "description": event.description ?? "", "location": event.location ?? "", "time": eventDate ?? ""])
      self.tableView.reloadData()
      
      // reset  image
      if let eventImageUrl = event.absoluteImage {
        ImageDownloader.shared.setImage(imageView: eventImageView, url: eventImageUrl)
      }
    }
  }
  
  func setupLayout() {
    self.eventImageView.snp.makeConstraints({make in
      make.center.equalTo(profileImageContainer.layoutMarginsGuide)
      make.height.equalTo(profileImageContainer.layoutMarginsGuide)
      make.width.equalTo(eventImageView.snp.height)
    })
  }
}

extension EditEventViewController: CropViewControllerDelegate {
  func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
    self.eventImageView.image = image
    cropViewController.dismiss(animated: false, completion: nil)
    
    if let eventId = self.event?.id {
      ImageUploader.shared.uploadEventImage(image: image, eventId: eventId).then({ data in
        if let responseData = data, var event = self.event {
          let decoder = JSONDecoder()
          let eventImageUrl = try decoder.decode(String.self, from: responseData)
          
          // update user with picture
          event.absoluteImage = eventImageUrl
        }
      }).catch { (error) in
        print(error)
      }
    }
  }
}

extension EditEventViewController {
  func updateEvent(id:String, event:EventInput) -> Promise<Event> {
    return Promise<Event> { fulfill, reject in
      let decoder = JSONDecoder()
      // update Event
      let gqlUpdateEvent = UpdateEventMutation(id: id, patch: event)
      GqlClient.shared.client.perform(mutation: gqlUpdateEvent) { result in
        switch result {
        case .success(let gqlResult):
          if let eventJson = gqlResult.data?.updateEvent?.jsonObject {
            do {
              let eventData = try JSONSerialization.data(withJSONObject: eventJson, options: [])
              let event =  try decoder.decode(Event.self, from: eventData )
              fulfill(event)
            } catch {
              print("Error happened in deserialization of Event, error:\(error)")
              reject(error)
            }
          } else {
            print("UpdateEvent returned no created event")
            reject(GenericError("CreateEventMutation returned no created event"))
          }
        case .failure(let error):
          reject(error)
        }
      }
    }
  }
}
