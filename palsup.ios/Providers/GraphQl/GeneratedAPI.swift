//  This file was automatically generated and should not be edited.

import Apollo

public struct UserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(gender: Swift.Optional<Gender?> = nil, name: Swift.Optional<NameInput?> = nil, email: Swift.Optional<String?> = nil, cell: Swift.Optional<String?> = nil, pushNotificationToken: Swift.Optional<String?> = nil, password: Swift.Optional<String?> = nil, location: Swift.Optional<LocationInput?> = nil, work: Swift.Optional<[WorkInput?]?> = nil, education: Swift.Optional<[EducationInput?]?> = nil, dob: Swift.Optional<String?> = nil, bio: Swift.Optional<String?> = nil, picture: Swift.Optional<PictureInput?> = nil) {
    graphQLMap = ["gender": gender, "name": name, "email": email, "cell": cell, "pushNotificationToken": pushNotificationToken, "password": password, "location": location, "work": work, "education": education, "dob": dob, "bio": bio, "picture": picture]
  }

  public var gender: Swift.Optional<Gender?> {
    get {
      return graphQLMap["gender"] as! Swift.Optional<Gender?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gender")
    }
  }

  public var name: Swift.Optional<NameInput?> {
    get {
      return graphQLMap["name"] as! Swift.Optional<NameInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var email: Swift.Optional<String?> {
    get {
      return graphQLMap["email"] as! Swift.Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var cell: Swift.Optional<String?> {
    get {
      return graphQLMap["cell"] as! Swift.Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cell")
    }
  }

  public var pushNotificationToken: Swift.Optional<String?> {
    get {
      return graphQLMap["pushNotificationToken"] as! Swift.Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pushNotificationToken")
    }
  }

  public var password: Swift.Optional<String?> {
    get {
      return graphQLMap["password"] as! Swift.Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }

  public var location: Swift.Optional<LocationInput?> {
    get {
      return graphQLMap["location"] as! Swift.Optional<LocationInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "location")
    }
  }

  public var work: Swift.Optional<[WorkInput?]?> {
    get {
      return graphQLMap["work"] as! Swift.Optional<[WorkInput?]?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "work")
    }
  }

  public var education: Swift.Optional<[EducationInput?]?> {
    get {
      return graphQLMap["education"] as! Swift.Optional<[EducationInput?]?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "education")
    }
  }

  public var dob: Swift.Optional<String?> {
    get {
      return graphQLMap["dob"] as! Swift.Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "dob")
    }
  }

  public var bio: Swift.Optional<String?> {
    get {
      return graphQLMap["bio"] as! Swift.Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bio")
    }
  }

  public var picture: Swift.Optional<PictureInput?> {
    get {
      return graphQLMap["picture"] as! Swift.Optional<PictureInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "picture")
    }
  }
}

public enum Gender: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case male
  case female
  case unknown
  case lgbtq
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "MALE": self = .male
      case "FEMALE": self = .female
      case "UNKNOWN": self = .unknown
      case "LGBTQ": self = .lgbtq
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .male: return "MALE"
      case .female: return "FEMALE"
      case .unknown: return "UNKNOWN"
      case .lgbtq: return "LGBTQ"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Gender, rhs: Gender) -> Bool {
    switch (lhs, rhs) {
      case (.male, .male): return true
      case (.female, .female): return true
      case (.unknown, .unknown): return true
      case (.lgbtq, .lgbtq): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public struct NameInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(first: String, last: String) {
    graphQLMap = ["first": first, "last": last]
  }

  public var first: String {
    get {
      return graphQLMap["first"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "first")
    }
  }

  public var last: String {
    get {
      return graphQLMap["last"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "last")
    }
  }
}

public struct LocationInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(address: Swift.Optional<String?> = nil, city: Swift.Optional<String?> = nil, state: Swift.Optional<String?> = nil, coordinates: Swift.Optional<CoordinatesInput?> = nil, radius: Swift.Optional<Int?> = nil) {
    graphQLMap = ["address": address, "city": city, "state": state, "coordinates": coordinates, "radius": radius]
  }

  public var address: Swift.Optional<String?> {
    get {
      return graphQLMap["address"] as! Swift.Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "address")
    }
  }

  public var city: Swift.Optional<String?> {
    get {
      return graphQLMap["city"] as! Swift.Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "city")
    }
  }

  public var state: Swift.Optional<String?> {
    get {
      return graphQLMap["state"] as! Swift.Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "state")
    }
  }

  public var coordinates: Swift.Optional<CoordinatesInput?> {
    get {
      return graphQLMap["coordinates"] as! Swift.Optional<CoordinatesInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "coordinates")
    }
  }

  public var radius: Swift.Optional<Int?> {
    get {
      return graphQLMap["radius"] as! Swift.Optional<Int?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "radius")
    }
  }
}

public struct CoordinatesInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(longitude: Double, latitude: Double) {
    graphQLMap = ["longitude": longitude, "latitude": latitude]
  }

  public var longitude: Double {
    get {
      return graphQLMap["longitude"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "longitude")
    }
  }

  public var latitude: Double {
    get {
      return graphQLMap["latitude"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "latitude")
    }
  }
}

public struct WorkInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(title: Swift.Optional<String?> = nil, organization: Swift.Optional<String?> = nil) {
    graphQLMap = ["title": title, "organization": organization]
  }

  public var title: Swift.Optional<String?> {
    get {
      return graphQLMap["title"] as! Swift.Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var organization: Swift.Optional<String?> {
    get {
      return graphQLMap["organization"] as! Swift.Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "organization")
    }
  }
}

public struct EducationInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(school: Swift.Optional<String?> = nil, `class`: Swift.Optional<String?> = nil) {
    graphQLMap = ["school": school, "class": `class`]
  }

  public var school: Swift.Optional<String?> {
    get {
      return graphQLMap["school"] as! Swift.Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "school")
    }
  }

  public var `class`: Swift.Optional<String?> {
    get {
      return graphQLMap["class"] as! Swift.Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "class")
    }
  }
}

public struct PictureInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(large: Swift.Optional<String?> = nil, medium: Swift.Optional<String?> = nil, thumbnail: Swift.Optional<String?> = nil) {
    graphQLMap = ["large": large, "medium": medium, "thumbnail": thumbnail]
  }

  public var large: Swift.Optional<String?> {
    get {
      return graphQLMap["large"] as! Swift.Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "large")
    }
  }

  public var medium: Swift.Optional<String?> {
    get {
      return graphQLMap["medium"] as! Swift.Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "medium")
    }
  }

  public var thumbnail: Swift.Optional<String?> {
    get {
      return graphQLMap["thumbnail"] as! Swift.Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "thumbnail")
    }
  }
}

public struct AuthInfoInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(userAuthId: String, passwordHash: String) {
    graphQLMap = ["userAuthId": userAuthId, "passwordHash": passwordHash]
  }

  public var userAuthId: String {
    get {
      return graphQLMap["userAuthId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userAuthId")
    }
  }

  public var passwordHash: String {
    get {
      return graphQLMap["passwordHash"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "passwordHash")
    }
  }
}

public struct PalInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(userId: GraphQLID, activity: String, location: LocationInput, date: Swift.Optional<DateRangeInput?> = nil) {
    graphQLMap = ["userId": userId, "activity": activity, "location": location, "date": date]
  }

  public var userId: GraphQLID {
    get {
      return graphQLMap["userId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userId")
    }
  }

  public var activity: String {
    get {
      return graphQLMap["activity"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "activity")
    }
  }

  public var location: LocationInput {
    get {
      return graphQLMap["location"] as! LocationInput
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "location")
    }
  }

  public var date: Swift.Optional<DateRangeInput?> {
    get {
      return graphQLMap["date"] as! Swift.Optional<DateRangeInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "date")
    }
  }
}

public struct DateRangeInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(startDate: String, endDate: String) {
    graphQLMap = ["startDate": startDate, "endDate": endDate]
  }

  public var startDate: String {
    get {
      return graphQLMap["startDate"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "startDate")
    }
  }

  public var endDate: String {
    get {
      return graphQLMap["endDate"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "endDate")
    }
  }
}

public struct ActivityFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(activity: Swift.Optional<String?> = nil, date: Swift.Optional<DateRangeInput?> = nil, location: Swift.Optional<LocationInput?> = nil) {
    graphQLMap = ["activity": activity, "date": date, "location": location]
  }

  public var activity: Swift.Optional<String?> {
    get {
      return graphQLMap["activity"] as! Swift.Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "activity")
    }
  }

  public var date: Swift.Optional<DateRangeInput?> {
    get {
      return graphQLMap["date"] as! Swift.Optional<DateRangeInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "date")
    }
  }

  public var location: Swift.Optional<LocationInput?> {
    get {
      return graphQLMap["location"] as! Swift.Optional<LocationInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "location")
    }
  }
}

public struct EventInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(description: Swift.Optional<String?> = nil, activity: Swift.Optional<String?> = nil, location: Swift.Optional<LocationInput?> = nil, date: Swift.Optional<DateRangeInput?> = nil, group: Swift.Optional<GroupInput?> = nil) {
    graphQLMap = ["description": description, "activity": activity, "location": location, "date": date, "group": group]
  }

  public var description: Swift.Optional<String?> {
    get {
      return graphQLMap["description"] as! Swift.Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  public var activity: Swift.Optional<String?> {
    get {
      return graphQLMap["activity"] as! Swift.Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "activity")
    }
  }

  public var location: Swift.Optional<LocationInput?> {
    get {
      return graphQLMap["location"] as! Swift.Optional<LocationInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "location")
    }
  }

  public var date: Swift.Optional<DateRangeInput?> {
    get {
      return graphQLMap["date"] as! Swift.Optional<DateRangeInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "date")
    }
  }

  public var group: Swift.Optional<GroupInput?> {
    get {
      return graphQLMap["group"] as! Swift.Optional<GroupInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "group")
    }
  }
}

public struct GroupInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(members: Swift.Optional<[GraphQLID]?> = nil) {
    graphQLMap = ["members": members]
  }

  public var members: Swift.Optional<[GraphQLID]?> {
    get {
      return graphQLMap["members"] as! Swift.Optional<[GraphQLID]?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "members")
    }
  }
}

public enum MessageType: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case event
  case group
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "EVENT": self = .event
      case "GROUP": self = .group
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .event: return "EVENT"
      case .group: return "GROUP"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MessageType, rhs: MessageType) -> Bool {
    switch (lhs, rhs) {
      case (.event, .event): return true
      case (.group, .group): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public struct MessageInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(from: GraphQLID, to: GraphQLID, type: Swift.Optional<MessageType?> = nil, content: Swift.Optional<MessageContentInput?> = nil) {
    graphQLMap = ["from": from, "to": to, "type": type, "content": content]
  }

  public var from: GraphQLID {
    get {
      return graphQLMap["from"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "from")
    }
  }

  public var to: GraphQLID {
    get {
      return graphQLMap["to"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "to")
    }
  }

  public var type: Swift.Optional<MessageType?> {
    get {
      return graphQLMap["type"] as! Swift.Optional<MessageType?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var content: Swift.Optional<MessageContentInput?> {
    get {
      return graphQLMap["content"] as! Swift.Optional<MessageContentInput?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "content")
    }
  }
}

public struct MessageContentInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(text: String) {
    graphQLMap = ["text": text]
  }

  public var text: String {
    get {
      return graphQLMap["text"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "text")
    }
  }
}

public final class CreateUserMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation createUser($user: UserInput) {\n  createUser(user: $user) {\n    __typename\n    id\n    name {\n      __typename\n      ...nameFields\n    }\n    gender\n    registrationDate\n    dob\n    email\n    cell\n    location {\n      __typename\n      ...locationFields\n    }\n    work {\n      __typename\n      ...workFields\n    }\n    education {\n      __typename\n      ...educationFields\n    }\n    bio\n    absolutePicture {\n      __typename\n      ...pictureFields\n    }\n  }\n}"

  public let operationName = "createUser"

  public var queryDocument: String { return operationDefinition.appending(NameFields.fragmentDefinition).appending(LocationFields.fragmentDefinition).appending(WorkFields.fragmentDefinition).appending(EducationFields.fragmentDefinition).appending(PictureFields.fragmentDefinition) }

  public var user: UserInput?

  public init(user: UserInput? = nil) {
    self.user = user
  }

  public var variables: GraphQLMap? {
    return ["user": user]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createUser", arguments: ["user": GraphQLVariable("user")], type: .object(CreateUser.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createUser: CreateUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createUser": createUser.flatMap { (value: CreateUser) -> ResultMap in value.resultMap }])
    }

    public var createUser: CreateUser? {
      get {
        return (resultMap["createUser"] as? ResultMap).flatMap { CreateUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createUser")
      }
    }

    public struct CreateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.object(Name.selections))),
        GraphQLField("gender", type: .nonNull(.scalar(Gender.self))),
        GraphQLField("registrationDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("dob", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .scalar(String.self)),
        GraphQLField("cell", type: .scalar(String.self)),
        GraphQLField("location", type: .object(Location.selections)),
        GraphQLField("work", type: .list(.object(Work.selections))),
        GraphQLField("education", type: .list(.object(Education.selections))),
        GraphQLField("bio", type: .scalar(String.self)),
        GraphQLField("absolutePicture", type: .object(AbsolutePicture.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: Name, gender: Gender, registrationDate: String, dob: String, email: String? = nil, cell: String? = nil, location: Location? = nil, work: [Work?]? = nil, education: [Education?]? = nil, bio: String? = nil, absolutePicture: AbsolutePicture? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name.resultMap, "gender": gender, "registrationDate": registrationDate, "dob": dob, "email": email, "cell": cell, "location": location.flatMap { (value: Location) -> ResultMap in value.resultMap }, "work": work.flatMap { (value: [Work?]) -> [ResultMap?] in value.map { (value: Work?) -> ResultMap? in value.flatMap { (value: Work) -> ResultMap in value.resultMap } } }, "education": education.flatMap { (value: [Education?]) -> [ResultMap?] in value.map { (value: Education?) -> ResultMap? in value.flatMap { (value: Education) -> ResultMap in value.resultMap } } }, "bio": bio, "absolutePicture": absolutePicture.flatMap { (value: AbsolutePicture) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: Name {
        get {
          return Name(unsafeResultMap: resultMap["name"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "name")
        }
      }

      public var gender: Gender {
        get {
          return resultMap["gender"]! as! Gender
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }

      public var registrationDate: String {
        get {
          return resultMap["registrationDate"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "registrationDate")
        }
      }

      public var dob: String {
        get {
          return resultMap["dob"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "dob")
        }
      }

      public var email: String? {
        get {
          return resultMap["email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var cell: String? {
        get {
          return resultMap["cell"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "cell")
        }
      }

      public var location: Location? {
        get {
          return (resultMap["location"] as? ResultMap).flatMap { Location(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "location")
        }
      }

      public var work: [Work?]? {
        get {
          return (resultMap["work"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Work?] in value.map { (value: ResultMap?) -> Work? in value.flatMap { (value: ResultMap) -> Work in Work(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Work?]) -> [ResultMap?] in value.map { (value: Work?) -> ResultMap? in value.flatMap { (value: Work) -> ResultMap in value.resultMap } } }, forKey: "work")
        }
      }

      public var education: [Education?]? {
        get {
          return (resultMap["education"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Education?] in value.map { (value: ResultMap?) -> Education? in value.flatMap { (value: ResultMap) -> Education in Education(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Education?]) -> [ResultMap?] in value.map { (value: Education?) -> ResultMap? in value.flatMap { (value: Education) -> ResultMap in value.resultMap } } }, forKey: "education")
        }
      }

      public var bio: String? {
        get {
          return resultMap["bio"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "bio")
        }
      }

      public var absolutePicture: AbsolutePicture? {
        get {
          return (resultMap["absolutePicture"] as? ResultMap).flatMap { AbsolutePicture(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "absolutePicture")
        }
      }

      public struct Name: GraphQLSelectionSet {
        public static let possibleTypes = ["Name"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(NameFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(first: String, last: String) {
          self.init(unsafeResultMap: ["__typename": "Name", "first": first, "last": last])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var nameFields: NameFields {
            get {
              return NameFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Location: GraphQLSelectionSet {
        public static let possibleTypes = ["Location"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(LocationFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var locationFields: LocationFields {
            get {
              return LocationFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Work: GraphQLSelectionSet {
        public static let possibleTypes = ["Work"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(WorkFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(organization: String? = nil, title: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Work", "organization": organization, "title": title])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var workFields: WorkFields {
            get {
              return WorkFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Education: GraphQLSelectionSet {
        public static let possibleTypes = ["Education"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(EducationFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(school: String? = nil, classOf: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Education", "school": school, "classOf": classOf])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var educationFields: EducationFields {
            get {
              return EducationFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct AbsolutePicture: GraphQLSelectionSet {
        public static let possibleTypes = ["Picture"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(PictureFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(large: String? = nil, medium: String? = nil, thumbnail: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Picture", "large": large, "medium": medium, "thumbnail": thumbnail])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var pictureFields: PictureFields {
            get {
              return PictureFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class UpdateUserMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation updateUser($id: ID!, $user: UserInput) {\n  updateUser(id: $id, user: $user) {\n    __typename\n    id\n    name {\n      __typename\n      ...nameFields\n    }\n    gender\n    registrationDate\n    dob\n    email\n    cell\n    location {\n      __typename\n      ...locationFields\n    }\n    work {\n      __typename\n      ...workFields\n    }\n    education {\n      __typename\n      ...educationFields\n    }\n    bio\n    absolutePicture {\n      __typename\n      ...pictureFields\n    }\n  }\n}"

  public let operationName = "updateUser"

  public var queryDocument: String { return operationDefinition.appending(NameFields.fragmentDefinition).appending(LocationFields.fragmentDefinition).appending(WorkFields.fragmentDefinition).appending(EducationFields.fragmentDefinition).appending(PictureFields.fragmentDefinition) }

  public var id: GraphQLID
  public var user: UserInput?

  public init(id: GraphQLID, user: UserInput? = nil) {
    self.id = id
    self.user = user
  }

  public var variables: GraphQLMap? {
    return ["id": id, "user": user]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateUser", arguments: ["id": GraphQLVariable("id"), "user": GraphQLVariable("user")], type: .object(UpdateUser.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateUser: UpdateUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateUser": updateUser.flatMap { (value: UpdateUser) -> ResultMap in value.resultMap }])
    }

    public var updateUser: UpdateUser? {
      get {
        return (resultMap["updateUser"] as? ResultMap).flatMap { UpdateUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateUser")
      }
    }

    public struct UpdateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.object(Name.selections))),
        GraphQLField("gender", type: .nonNull(.scalar(Gender.self))),
        GraphQLField("registrationDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("dob", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .scalar(String.self)),
        GraphQLField("cell", type: .scalar(String.self)),
        GraphQLField("location", type: .object(Location.selections)),
        GraphQLField("work", type: .list(.object(Work.selections))),
        GraphQLField("education", type: .list(.object(Education.selections))),
        GraphQLField("bio", type: .scalar(String.self)),
        GraphQLField("absolutePicture", type: .object(AbsolutePicture.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: Name, gender: Gender, registrationDate: String, dob: String, email: String? = nil, cell: String? = nil, location: Location? = nil, work: [Work?]? = nil, education: [Education?]? = nil, bio: String? = nil, absolutePicture: AbsolutePicture? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name.resultMap, "gender": gender, "registrationDate": registrationDate, "dob": dob, "email": email, "cell": cell, "location": location.flatMap { (value: Location) -> ResultMap in value.resultMap }, "work": work.flatMap { (value: [Work?]) -> [ResultMap?] in value.map { (value: Work?) -> ResultMap? in value.flatMap { (value: Work) -> ResultMap in value.resultMap } } }, "education": education.flatMap { (value: [Education?]) -> [ResultMap?] in value.map { (value: Education?) -> ResultMap? in value.flatMap { (value: Education) -> ResultMap in value.resultMap } } }, "bio": bio, "absolutePicture": absolutePicture.flatMap { (value: AbsolutePicture) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: Name {
        get {
          return Name(unsafeResultMap: resultMap["name"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "name")
        }
      }

      public var gender: Gender {
        get {
          return resultMap["gender"]! as! Gender
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }

      public var registrationDate: String {
        get {
          return resultMap["registrationDate"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "registrationDate")
        }
      }

      public var dob: String {
        get {
          return resultMap["dob"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "dob")
        }
      }

      public var email: String? {
        get {
          return resultMap["email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var cell: String? {
        get {
          return resultMap["cell"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "cell")
        }
      }

      public var location: Location? {
        get {
          return (resultMap["location"] as? ResultMap).flatMap { Location(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "location")
        }
      }

      public var work: [Work?]? {
        get {
          return (resultMap["work"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Work?] in value.map { (value: ResultMap?) -> Work? in value.flatMap { (value: ResultMap) -> Work in Work(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Work?]) -> [ResultMap?] in value.map { (value: Work?) -> ResultMap? in value.flatMap { (value: Work) -> ResultMap in value.resultMap } } }, forKey: "work")
        }
      }

      public var education: [Education?]? {
        get {
          return (resultMap["education"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Education?] in value.map { (value: ResultMap?) -> Education? in value.flatMap { (value: ResultMap) -> Education in Education(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Education?]) -> [ResultMap?] in value.map { (value: Education?) -> ResultMap? in value.flatMap { (value: Education) -> ResultMap in value.resultMap } } }, forKey: "education")
        }
      }

      public var bio: String? {
        get {
          return resultMap["bio"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "bio")
        }
      }

      public var absolutePicture: AbsolutePicture? {
        get {
          return (resultMap["absolutePicture"] as? ResultMap).flatMap { AbsolutePicture(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "absolutePicture")
        }
      }

      public struct Name: GraphQLSelectionSet {
        public static let possibleTypes = ["Name"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(NameFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(first: String, last: String) {
          self.init(unsafeResultMap: ["__typename": "Name", "first": first, "last": last])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var nameFields: NameFields {
            get {
              return NameFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Location: GraphQLSelectionSet {
        public static let possibleTypes = ["Location"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(LocationFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var locationFields: LocationFields {
            get {
              return LocationFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Work: GraphQLSelectionSet {
        public static let possibleTypes = ["Work"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(WorkFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(organization: String? = nil, title: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Work", "organization": organization, "title": title])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var workFields: WorkFields {
            get {
              return WorkFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Education: GraphQLSelectionSet {
        public static let possibleTypes = ["Education"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(EducationFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(school: String? = nil, classOf: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Education", "school": school, "classOf": classOf])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var educationFields: EducationFields {
            get {
              return EducationFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct AbsolutePicture: GraphQLSelectionSet {
        public static let possibleTypes = ["Picture"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(PictureFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(large: String? = nil, medium: String? = nil, thumbnail: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Picture", "large": large, "medium": medium, "thumbnail": thumbnail])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var pictureFields: PictureFields {
            get {
              return PictureFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class GetUsersByIdQuery: GraphQLQuery {
  public let operationDefinition =
    "query getUsersById($ids: [ID!]) {\n  getUsersById(ids: $ids) {\n    __typename\n    id\n    name {\n      __typename\n      ...nameFields\n    }\n    gender\n    registrationDate\n    dob\n    email\n    cell\n    location {\n      __typename\n      ...locationFields\n    }\n    work {\n      __typename\n      ...workFields\n    }\n    education {\n      __typename\n      ...educationFields\n    }\n    bio\n    absolutePicture {\n      __typename\n      ...pictureFields\n    }\n  }\n}"

  public let operationName = "getUsersById"

  public var queryDocument: String { return operationDefinition.appending(NameFields.fragmentDefinition).appending(LocationFields.fragmentDefinition).appending(WorkFields.fragmentDefinition).appending(EducationFields.fragmentDefinition).appending(PictureFields.fragmentDefinition) }

  public var ids: [GraphQLID]?

  public init(ids: [GraphQLID]?) {
    self.ids = ids
  }

  public var variables: GraphQLMap? {
    return ["ids": ids]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getUsersById", arguments: ["ids": GraphQLVariable("ids")], type: .list(.object(GetUsersById.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getUsersById: [GetUsersById?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getUsersById": getUsersById.flatMap { (value: [GetUsersById?]) -> [ResultMap?] in value.map { (value: GetUsersById?) -> ResultMap? in value.flatMap { (value: GetUsersById) -> ResultMap in value.resultMap } } }])
    }

    public var getUsersById: [GetUsersById?]? {
      get {
        return (resultMap["getUsersById"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [GetUsersById?] in value.map { (value: ResultMap?) -> GetUsersById? in value.flatMap { (value: ResultMap) -> GetUsersById in GetUsersById(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [GetUsersById?]) -> [ResultMap?] in value.map { (value: GetUsersById?) -> ResultMap? in value.flatMap { (value: GetUsersById) -> ResultMap in value.resultMap } } }, forKey: "getUsersById")
      }
    }

    public struct GetUsersById: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.object(Name.selections))),
        GraphQLField("gender", type: .nonNull(.scalar(Gender.self))),
        GraphQLField("registrationDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("dob", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .scalar(String.self)),
        GraphQLField("cell", type: .scalar(String.self)),
        GraphQLField("location", type: .object(Location.selections)),
        GraphQLField("work", type: .list(.object(Work.selections))),
        GraphQLField("education", type: .list(.object(Education.selections))),
        GraphQLField("bio", type: .scalar(String.self)),
        GraphQLField("absolutePicture", type: .object(AbsolutePicture.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: Name, gender: Gender, registrationDate: String, dob: String, email: String? = nil, cell: String? = nil, location: Location? = nil, work: [Work?]? = nil, education: [Education?]? = nil, bio: String? = nil, absolutePicture: AbsolutePicture? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name.resultMap, "gender": gender, "registrationDate": registrationDate, "dob": dob, "email": email, "cell": cell, "location": location.flatMap { (value: Location) -> ResultMap in value.resultMap }, "work": work.flatMap { (value: [Work?]) -> [ResultMap?] in value.map { (value: Work?) -> ResultMap? in value.flatMap { (value: Work) -> ResultMap in value.resultMap } } }, "education": education.flatMap { (value: [Education?]) -> [ResultMap?] in value.map { (value: Education?) -> ResultMap? in value.flatMap { (value: Education) -> ResultMap in value.resultMap } } }, "bio": bio, "absolutePicture": absolutePicture.flatMap { (value: AbsolutePicture) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: Name {
        get {
          return Name(unsafeResultMap: resultMap["name"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "name")
        }
      }

      public var gender: Gender {
        get {
          return resultMap["gender"]! as! Gender
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }

      public var registrationDate: String {
        get {
          return resultMap["registrationDate"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "registrationDate")
        }
      }

      public var dob: String {
        get {
          return resultMap["dob"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "dob")
        }
      }

      public var email: String? {
        get {
          return resultMap["email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var cell: String? {
        get {
          return resultMap["cell"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "cell")
        }
      }

      public var location: Location? {
        get {
          return (resultMap["location"] as? ResultMap).flatMap { Location(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "location")
        }
      }

      public var work: [Work?]? {
        get {
          return (resultMap["work"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Work?] in value.map { (value: ResultMap?) -> Work? in value.flatMap { (value: ResultMap) -> Work in Work(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Work?]) -> [ResultMap?] in value.map { (value: Work?) -> ResultMap? in value.flatMap { (value: Work) -> ResultMap in value.resultMap } } }, forKey: "work")
        }
      }

      public var education: [Education?]? {
        get {
          return (resultMap["education"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Education?] in value.map { (value: ResultMap?) -> Education? in value.flatMap { (value: ResultMap) -> Education in Education(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Education?]) -> [ResultMap?] in value.map { (value: Education?) -> ResultMap? in value.flatMap { (value: Education) -> ResultMap in value.resultMap } } }, forKey: "education")
        }
      }

      public var bio: String? {
        get {
          return resultMap["bio"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "bio")
        }
      }

      public var absolutePicture: AbsolutePicture? {
        get {
          return (resultMap["absolutePicture"] as? ResultMap).flatMap { AbsolutePicture(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "absolutePicture")
        }
      }

      public struct Name: GraphQLSelectionSet {
        public static let possibleTypes = ["Name"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(NameFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(first: String, last: String) {
          self.init(unsafeResultMap: ["__typename": "Name", "first": first, "last": last])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var nameFields: NameFields {
            get {
              return NameFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Location: GraphQLSelectionSet {
        public static let possibleTypes = ["Location"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(LocationFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var locationFields: LocationFields {
            get {
              return LocationFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Work: GraphQLSelectionSet {
        public static let possibleTypes = ["Work"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(WorkFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(organization: String? = nil, title: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Work", "organization": organization, "title": title])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var workFields: WorkFields {
            get {
              return WorkFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Education: GraphQLSelectionSet {
        public static let possibleTypes = ["Education"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(EducationFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(school: String? = nil, classOf: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Education", "school": school, "classOf": classOf])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var educationFields: EducationFields {
            get {
              return EducationFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct AbsolutePicture: GraphQLSelectionSet {
        public static let possibleTypes = ["Picture"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(PictureFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(large: String? = nil, medium: String? = nil, thumbnail: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Picture", "large": large, "medium": medium, "thumbnail": thumbnail])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var pictureFields: PictureFields {
            get {
              return PictureFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class GetUserByAuthInfoQuery: GraphQLQuery {
  public let operationDefinition =
    "query getUserByAuthInfo($authInfo: AuthInfoInput) {\n  getUserByAuthInfo(authInfo: $authInfo) {\n    __typename\n    id\n    name {\n      __typename\n      ...nameFields\n    }\n    gender\n    registrationDate\n    dob\n    email\n    cell\n    location {\n      __typename\n      ...locationFields\n    }\n    work {\n      __typename\n      ...workFields\n    }\n    education {\n      __typename\n      ...educationFields\n    }\n    bio\n    absolutePicture {\n      __typename\n      ...pictureFields\n    }\n  }\n}"

  public let operationName = "getUserByAuthInfo"

  public var queryDocument: String { return operationDefinition.appending(NameFields.fragmentDefinition).appending(LocationFields.fragmentDefinition).appending(WorkFields.fragmentDefinition).appending(EducationFields.fragmentDefinition).appending(PictureFields.fragmentDefinition) }

  public var authInfo: AuthInfoInput?

  public init(authInfo: AuthInfoInput? = nil) {
    self.authInfo = authInfo
  }

  public var variables: GraphQLMap? {
    return ["authInfo": authInfo]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getUserByAuthInfo", arguments: ["authInfo": GraphQLVariable("authInfo")], type: .object(GetUserByAuthInfo.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getUserByAuthInfo: GetUserByAuthInfo? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getUserByAuthInfo": getUserByAuthInfo.flatMap { (value: GetUserByAuthInfo) -> ResultMap in value.resultMap }])
    }

    public var getUserByAuthInfo: GetUserByAuthInfo? {
      get {
        return (resultMap["getUserByAuthInfo"] as? ResultMap).flatMap { GetUserByAuthInfo(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "getUserByAuthInfo")
      }
    }

    public struct GetUserByAuthInfo: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.object(Name.selections))),
        GraphQLField("gender", type: .nonNull(.scalar(Gender.self))),
        GraphQLField("registrationDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("dob", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .scalar(String.self)),
        GraphQLField("cell", type: .scalar(String.self)),
        GraphQLField("location", type: .object(Location.selections)),
        GraphQLField("work", type: .list(.object(Work.selections))),
        GraphQLField("education", type: .list(.object(Education.selections))),
        GraphQLField("bio", type: .scalar(String.self)),
        GraphQLField("absolutePicture", type: .object(AbsolutePicture.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: Name, gender: Gender, registrationDate: String, dob: String, email: String? = nil, cell: String? = nil, location: Location? = nil, work: [Work?]? = nil, education: [Education?]? = nil, bio: String? = nil, absolutePicture: AbsolutePicture? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name.resultMap, "gender": gender, "registrationDate": registrationDate, "dob": dob, "email": email, "cell": cell, "location": location.flatMap { (value: Location) -> ResultMap in value.resultMap }, "work": work.flatMap { (value: [Work?]) -> [ResultMap?] in value.map { (value: Work?) -> ResultMap? in value.flatMap { (value: Work) -> ResultMap in value.resultMap } } }, "education": education.flatMap { (value: [Education?]) -> [ResultMap?] in value.map { (value: Education?) -> ResultMap? in value.flatMap { (value: Education) -> ResultMap in value.resultMap } } }, "bio": bio, "absolutePicture": absolutePicture.flatMap { (value: AbsolutePicture) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: Name {
        get {
          return Name(unsafeResultMap: resultMap["name"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "name")
        }
      }

      public var gender: Gender {
        get {
          return resultMap["gender"]! as! Gender
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }

      public var registrationDate: String {
        get {
          return resultMap["registrationDate"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "registrationDate")
        }
      }

      public var dob: String {
        get {
          return resultMap["dob"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "dob")
        }
      }

      public var email: String? {
        get {
          return resultMap["email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var cell: String? {
        get {
          return resultMap["cell"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "cell")
        }
      }

      public var location: Location? {
        get {
          return (resultMap["location"] as? ResultMap).flatMap { Location(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "location")
        }
      }

      public var work: [Work?]? {
        get {
          return (resultMap["work"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Work?] in value.map { (value: ResultMap?) -> Work? in value.flatMap { (value: ResultMap) -> Work in Work(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Work?]) -> [ResultMap?] in value.map { (value: Work?) -> ResultMap? in value.flatMap { (value: Work) -> ResultMap in value.resultMap } } }, forKey: "work")
        }
      }

      public var education: [Education?]? {
        get {
          return (resultMap["education"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Education?] in value.map { (value: ResultMap?) -> Education? in value.flatMap { (value: ResultMap) -> Education in Education(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Education?]) -> [ResultMap?] in value.map { (value: Education?) -> ResultMap? in value.flatMap { (value: Education) -> ResultMap in value.resultMap } } }, forKey: "education")
        }
      }

      public var bio: String? {
        get {
          return resultMap["bio"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "bio")
        }
      }

      public var absolutePicture: AbsolutePicture? {
        get {
          return (resultMap["absolutePicture"] as? ResultMap).flatMap { AbsolutePicture(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "absolutePicture")
        }
      }

      public struct Name: GraphQLSelectionSet {
        public static let possibleTypes = ["Name"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(NameFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(first: String, last: String) {
          self.init(unsafeResultMap: ["__typename": "Name", "first": first, "last": last])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var nameFields: NameFields {
            get {
              return NameFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Location: GraphQLSelectionSet {
        public static let possibleTypes = ["Location"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(LocationFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var locationFields: LocationFields {
            get {
              return LocationFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Work: GraphQLSelectionSet {
        public static let possibleTypes = ["Work"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(WorkFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(organization: String? = nil, title: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Work", "organization": organization, "title": title])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var workFields: WorkFields {
            get {
              return WorkFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Education: GraphQLSelectionSet {
        public static let possibleTypes = ["Education"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(EducationFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(school: String? = nil, classOf: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Education", "school": school, "classOf": classOf])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var educationFields: EducationFields {
            get {
              return EducationFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct AbsolutePicture: GraphQLSelectionSet {
        public static let possibleTypes = ["Picture"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(PictureFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(large: String? = nil, medium: String? = nil, thumbnail: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Picture", "large": large, "medium": medium, "thumbnail": thumbnail])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var pictureFields: PictureFields {
            get {
              return PictureFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class CreatePalMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation createPal($pal: PalInput) {\n  createPal(pal: $pal) {\n    __typename\n    id\n    activity\n    location {\n      __typename\n      ...locationFields\n    }\n    date {\n      __typename\n      ...dateRangeFields\n    }\n    interested\n  }\n}"

  public let operationName = "createPal"

  public var queryDocument: String { return operationDefinition.appending(LocationFields.fragmentDefinition).appending(DateRangeFields.fragmentDefinition) }

  public var pal: PalInput?

  public init(pal: PalInput? = nil) {
    self.pal = pal
  }

  public var variables: GraphQLMap? {
    return ["pal": pal]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createPal", arguments: ["pal": GraphQLVariable("pal")], type: .object(CreatePal.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createPal: CreatePal? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createPal": createPal.flatMap { (value: CreatePal) -> ResultMap in value.resultMap }])
    }

    public var createPal: CreatePal? {
      get {
        return (resultMap["createPal"] as? ResultMap).flatMap { CreatePal(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createPal")
      }
    }

    public struct CreatePal: GraphQLSelectionSet {
      public static let possibleTypes = ["Pal"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("activity", type: .nonNull(.scalar(String.self))),
        GraphQLField("location", type: .nonNull(.object(Location.selections))),
        GraphQLField("date", type: .object(Date.selections)),
        GraphQLField("interested", type: .list(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, activity: String, location: Location, date: Date? = nil, interested: [GraphQLID?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Pal", "id": id, "activity": activity, "location": location.resultMap, "date": date.flatMap { (value: Date) -> ResultMap in value.resultMap }, "interested": interested])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var activity: String {
        get {
          return resultMap["activity"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "activity")
        }
      }

      public var location: Location {
        get {
          return Location(unsafeResultMap: resultMap["location"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "location")
        }
      }

      public var date: Date? {
        get {
          return (resultMap["date"] as? ResultMap).flatMap { Date(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "date")
        }
      }

      public var interested: [GraphQLID?]? {
        get {
          return resultMap["interested"] as? [GraphQLID?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "interested")
        }
      }

      public struct Location: GraphQLSelectionSet {
        public static let possibleTypes = ["Location"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(LocationFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var locationFields: LocationFields {
            get {
              return LocationFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Date: GraphQLSelectionSet {
        public static let possibleTypes = ["DateRange"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(DateRangeFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(startDate: String? = nil, endDate: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "DateRange", "startDate": startDate, "endDate": endDate])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var dateRangeFields: DateRangeFields {
            get {
              return DateRangeFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class AddToPalsInterestedMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation addToPalsInterested($palId: ID!, $interestedPalId: ID!) {\n  addToPalsInterested(palId: $palId, interestedPalId: $interestedPalId)\n}"

  public let operationName = "addToPalsInterested"

  public var palId: GraphQLID
  public var interestedPalId: GraphQLID

  public init(palId: GraphQLID, interestedPalId: GraphQLID) {
    self.palId = palId
    self.interestedPalId = interestedPalId
  }

  public var variables: GraphQLMap? {
    return ["palId": palId, "interestedPalId": interestedPalId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("addToPalsInterested", arguments: ["palId": GraphQLVariable("palId"), "interestedPalId": GraphQLVariable("interestedPalId")], type: .scalar(GraphQLID.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addToPalsInterested: GraphQLID? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addToPalsInterested": addToPalsInterested])
    }

    public var addToPalsInterested: GraphQLID? {
      get {
        return resultMap["addToPalsInterested"] as? GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "addToPalsInterested")
      }
    }
  }
}

public final class RemoveFromPalsInterestedMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation removeFromPalsInterested($palId: ID!, $userId: ID!) {\n  removeFromPalsInterested(palId: $palId, userId: $userId)\n}"

  public let operationName = "removeFromPalsInterested"

  public var palId: GraphQLID
  public var userId: GraphQLID

  public init(palId: GraphQLID, userId: GraphQLID) {
    self.palId = palId
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["palId": palId, "userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("removeFromPalsInterested", arguments: ["palId": GraphQLVariable("palId"), "userId": GraphQLVariable("userId")], type: .scalar(GraphQLID.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(removeFromPalsInterested: GraphQLID? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "removeFromPalsInterested": removeFromPalsInterested])
    }

    public var removeFromPalsInterested: GraphQLID? {
      get {
        return resultMap["removeFromPalsInterested"] as? GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "removeFromPalsInterested")
      }
    }
  }
}

public final class AddToEventsWaitlistMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation addToEventsWaitlist($eventId: ID!, $userId: ID!) {\n  addToEventsWaitlist(eventId: $eventId, userId: $userId)\n}"

  public let operationName = "addToEventsWaitlist"

  public var eventId: GraphQLID
  public var userId: GraphQLID

  public init(eventId: GraphQLID, userId: GraphQLID) {
    self.eventId = eventId
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["eventId": eventId, "userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("addToEventsWaitlist", arguments: ["eventId": GraphQLVariable("eventId"), "userId": GraphQLVariable("userId")], type: .scalar(GraphQLID.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addToEventsWaitlist: GraphQLID? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addToEventsWaitlist": addToEventsWaitlist])
    }

    public var addToEventsWaitlist: GraphQLID? {
      get {
        return resultMap["addToEventsWaitlist"] as? GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "addToEventsWaitlist")
      }
    }
  }
}

public final class RemoveFromEventsWaitlistMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation removeFromEventsWaitlist($eventId: ID!, $userId: ID!) {\n  removeFromEventsWaitlist(eventId: $eventId, userId: $userId)\n}"

  public let operationName = "removeFromEventsWaitlist"

  public var eventId: GraphQLID
  public var userId: GraphQLID

  public init(eventId: GraphQLID, userId: GraphQLID) {
    self.eventId = eventId
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["eventId": eventId, "userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("removeFromEventsWaitlist", arguments: ["eventId": GraphQLVariable("eventId"), "userId": GraphQLVariable("userId")], type: .scalar(GraphQLID.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(removeFromEventsWaitlist: GraphQLID? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "removeFromEventsWaitlist": removeFromEventsWaitlist])
    }

    public var removeFromEventsWaitlist: GraphQLID? {
      get {
        return resultMap["removeFromEventsWaitlist"] as? GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "removeFromEventsWaitlist")
      }
    }
  }
}

public final class SubmitVoteOnEventsWaitlistMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation submitVoteOnEventsWaitlist($eventId: ID!, $waitlistUserId: ID!, $vote: Boolean) {\n  submitVoteOnEventsWaitlist(eventId: $eventId, waitlistUserId: $waitlistUserId, vote: $vote)\n}"

  public let operationName = "submitVoteOnEventsWaitlist"

  public var eventId: GraphQLID
  public var waitlistUserId: GraphQLID
  public var vote: Bool?

  public init(eventId: GraphQLID, waitlistUserId: GraphQLID, vote: Bool? = nil) {
    self.eventId = eventId
    self.waitlistUserId = waitlistUserId
    self.vote = vote
  }

  public var variables: GraphQLMap? {
    return ["eventId": eventId, "waitlistUserId": waitlistUserId, "vote": vote]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("submitVoteOnEventsWaitlist", arguments: ["eventId": GraphQLVariable("eventId"), "waitlistUserId": GraphQLVariable("waitlistUserId"), "vote": GraphQLVariable("vote")], type: .scalar(GraphQLID.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(submitVoteOnEventsWaitlist: GraphQLID? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "submitVoteOnEventsWaitlist": submitVoteOnEventsWaitlist])
    }

    public var submitVoteOnEventsWaitlist: GraphQLID? {
      get {
        return resultMap["submitVoteOnEventsWaitlist"] as? GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "submitVoteOnEventsWaitlist")
      }
    }
  }
}

public final class GetPalsByActivityQuery: GraphQLQuery {
  public let operationDefinition =
    "query getPalsByActivity($userId: ID, $activityFilter: ActivityFilterInput) {\n  getPalsByActivity(userId: $userId, activityFilter: $activityFilter) {\n    __typename\n    id\n    user {\n      __typename\n      id\n      name {\n        __typename\n        ...nameFields\n      }\n      work {\n        __typename\n        ...workFields\n      }\n      education {\n        __typename\n        ...educationFields\n      }\n      bio\n      absolutePicture {\n        __typename\n        ...pictureFields\n      }\n    }\n    activity\n    date {\n      __typename\n      ...dateRangeFields\n    }\n    location {\n      __typename\n      ...locationFields\n    }\n    interested\n  }\n}"

  public let operationName = "getPalsByActivity"

  public var queryDocument: String { return operationDefinition.appending(NameFields.fragmentDefinition).appending(WorkFields.fragmentDefinition).appending(EducationFields.fragmentDefinition).appending(PictureFields.fragmentDefinition).appending(DateRangeFields.fragmentDefinition).appending(LocationFields.fragmentDefinition) }

  public var userId: GraphQLID?
  public var activityFilter: ActivityFilterInput?

  public init(userId: GraphQLID? = nil, activityFilter: ActivityFilterInput? = nil) {
    self.userId = userId
    self.activityFilter = activityFilter
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "activityFilter": activityFilter]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getPalsByActivity", arguments: ["userId": GraphQLVariable("userId"), "activityFilter": GraphQLVariable("activityFilter")], type: .list(.object(GetPalsByActivity.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getPalsByActivity: [GetPalsByActivity?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getPalsByActivity": getPalsByActivity.flatMap { (value: [GetPalsByActivity?]) -> [ResultMap?] in value.map { (value: GetPalsByActivity?) -> ResultMap? in value.flatMap { (value: GetPalsByActivity) -> ResultMap in value.resultMap } } }])
    }

    public var getPalsByActivity: [GetPalsByActivity?]? {
      get {
        return (resultMap["getPalsByActivity"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [GetPalsByActivity?] in value.map { (value: ResultMap?) -> GetPalsByActivity? in value.flatMap { (value: ResultMap) -> GetPalsByActivity in GetPalsByActivity(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [GetPalsByActivity?]) -> [ResultMap?] in value.map { (value: GetPalsByActivity?) -> ResultMap? in value.flatMap { (value: GetPalsByActivity) -> ResultMap in value.resultMap } } }, forKey: "getPalsByActivity")
      }
    }

    public struct GetPalsByActivity: GraphQLSelectionSet {
      public static let possibleTypes = ["Pal"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("user", type: .object(User.selections)),
        GraphQLField("activity", type: .nonNull(.scalar(String.self))),
        GraphQLField("date", type: .object(Date.selections)),
        GraphQLField("location", type: .nonNull(.object(Location.selections))),
        GraphQLField("interested", type: .list(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, user: User? = nil, activity: String, date: Date? = nil, location: Location, interested: [GraphQLID?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Pal", "id": id, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "activity": activity, "date": date.flatMap { (value: Date) -> ResultMap in value.resultMap }, "location": location.resultMap, "interested": interested])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      public var activity: String {
        get {
          return resultMap["activity"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "activity")
        }
      }

      public var date: Date? {
        get {
          return (resultMap["date"] as? ResultMap).flatMap { Date(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "date")
        }
      }

      public var location: Location {
        get {
          return Location(unsafeResultMap: resultMap["location"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "location")
        }
      }

      public var interested: [GraphQLID?]? {
        get {
          return resultMap["interested"] as? [GraphQLID?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "interested")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.object(Name.selections))),
          GraphQLField("work", type: .list(.object(Work.selections))),
          GraphQLField("education", type: .list(.object(Education.selections))),
          GraphQLField("bio", type: .scalar(String.self)),
          GraphQLField("absolutePicture", type: .object(AbsolutePicture.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: Name, work: [Work?]? = nil, education: [Education?]? = nil, bio: String? = nil, absolutePicture: AbsolutePicture? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name.resultMap, "work": work.flatMap { (value: [Work?]) -> [ResultMap?] in value.map { (value: Work?) -> ResultMap? in value.flatMap { (value: Work) -> ResultMap in value.resultMap } } }, "education": education.flatMap { (value: [Education?]) -> [ResultMap?] in value.map { (value: Education?) -> ResultMap? in value.flatMap { (value: Education) -> ResultMap in value.resultMap } } }, "bio": bio, "absolutePicture": absolutePicture.flatMap { (value: AbsolutePicture) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: Name {
          get {
            return Name(unsafeResultMap: resultMap["name"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "name")
          }
        }

        public var work: [Work?]? {
          get {
            return (resultMap["work"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Work?] in value.map { (value: ResultMap?) -> Work? in value.flatMap { (value: ResultMap) -> Work in Work(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Work?]) -> [ResultMap?] in value.map { (value: Work?) -> ResultMap? in value.flatMap { (value: Work) -> ResultMap in value.resultMap } } }, forKey: "work")
          }
        }

        public var education: [Education?]? {
          get {
            return (resultMap["education"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Education?] in value.map { (value: ResultMap?) -> Education? in value.flatMap { (value: ResultMap) -> Education in Education(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Education?]) -> [ResultMap?] in value.map { (value: Education?) -> ResultMap? in value.flatMap { (value: Education) -> ResultMap in value.resultMap } } }, forKey: "education")
          }
        }

        public var bio: String? {
          get {
            return resultMap["bio"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "bio")
          }
        }

        public var absolutePicture: AbsolutePicture? {
          get {
            return (resultMap["absolutePicture"] as? ResultMap).flatMap { AbsolutePicture(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "absolutePicture")
          }
        }

        public struct Name: GraphQLSelectionSet {
          public static let possibleTypes = ["Name"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(NameFields.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(first: String, last: String) {
            self.init(unsafeResultMap: ["__typename": "Name", "first": first, "last": last])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var nameFields: NameFields {
              get {
                return NameFields(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }

        public struct Work: GraphQLSelectionSet {
          public static let possibleTypes = ["Work"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(WorkFields.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(organization: String? = nil, title: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Work", "organization": organization, "title": title])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var workFields: WorkFields {
              get {
                return WorkFields(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }

        public struct Education: GraphQLSelectionSet {
          public static let possibleTypes = ["Education"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(EducationFields.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(school: String? = nil, classOf: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Education", "school": school, "classOf": classOf])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var educationFields: EducationFields {
              get {
                return EducationFields(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }

        public struct AbsolutePicture: GraphQLSelectionSet {
          public static let possibleTypes = ["Picture"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(PictureFields.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(large: String? = nil, medium: String? = nil, thumbnail: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Picture", "large": large, "medium": medium, "thumbnail": thumbnail])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var pictureFields: PictureFields {
              get {
                return PictureFields(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }

      public struct Date: GraphQLSelectionSet {
        public static let possibleTypes = ["DateRange"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(DateRangeFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(startDate: String? = nil, endDate: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "DateRange", "startDate": startDate, "endDate": endDate])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var dateRangeFields: DateRangeFields {
            get {
              return DateRangeFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Location: GraphQLSelectionSet {
        public static let possibleTypes = ["Location"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(LocationFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var locationFields: LocationFields {
            get {
              return LocationFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class GetPalsForUserSortedByDateQuery: GraphQLQuery {
  public let operationDefinition =
    "query getPalsForUserSortedByDate($userId: ID!, $excludeIds: [ID]) {\n  getPalsForUserSortedByDate(userId: $userId, excludeIds: $excludeIds) {\n    __typename\n    id\n    activity\n    date {\n      __typename\n      ...dateRangeFields\n    }\n    interested\n  }\n}"

  public let operationName = "getPalsForUserSortedByDate"

  public var queryDocument: String { return operationDefinition.appending(DateRangeFields.fragmentDefinition) }

  public var userId: GraphQLID
  public var excludeIds: [GraphQLID?]?

  public init(userId: GraphQLID, excludeIds: [GraphQLID?]? = nil) {
    self.userId = userId
    self.excludeIds = excludeIds
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "excludeIds": excludeIds]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getPalsForUserSortedByDate", arguments: ["userId": GraphQLVariable("userId"), "excludeIds": GraphQLVariable("excludeIds")], type: .list(.object(GetPalsForUserSortedByDate.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getPalsForUserSortedByDate: [GetPalsForUserSortedByDate?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getPalsForUserSortedByDate": getPalsForUserSortedByDate.flatMap { (value: [GetPalsForUserSortedByDate?]) -> [ResultMap?] in value.map { (value: GetPalsForUserSortedByDate?) -> ResultMap? in value.flatMap { (value: GetPalsForUserSortedByDate) -> ResultMap in value.resultMap } } }])
    }

    public var getPalsForUserSortedByDate: [GetPalsForUserSortedByDate?]? {
      get {
        return (resultMap["getPalsForUserSortedByDate"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [GetPalsForUserSortedByDate?] in value.map { (value: ResultMap?) -> GetPalsForUserSortedByDate? in value.flatMap { (value: ResultMap) -> GetPalsForUserSortedByDate in GetPalsForUserSortedByDate(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [GetPalsForUserSortedByDate?]) -> [ResultMap?] in value.map { (value: GetPalsForUserSortedByDate?) -> ResultMap? in value.flatMap { (value: GetPalsForUserSortedByDate) -> ResultMap in value.resultMap } } }, forKey: "getPalsForUserSortedByDate")
      }
    }

    public struct GetPalsForUserSortedByDate: GraphQLSelectionSet {
      public static let possibleTypes = ["Pal"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("activity", type: .nonNull(.scalar(String.self))),
        GraphQLField("date", type: .object(Date.selections)),
        GraphQLField("interested", type: .list(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, activity: String, date: Date? = nil, interested: [GraphQLID?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Pal", "id": id, "activity": activity, "date": date.flatMap { (value: Date) -> ResultMap in value.resultMap }, "interested": interested])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var activity: String {
        get {
          return resultMap["activity"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "activity")
        }
      }

      public var date: Date? {
        get {
          return (resultMap["date"] as? ResultMap).flatMap { Date(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "date")
        }
      }

      public var interested: [GraphQLID?]? {
        get {
          return resultMap["interested"] as? [GraphQLID?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "interested")
        }
      }

      public struct Date: GraphQLSelectionSet {
        public static let possibleTypes = ["DateRange"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(DateRangeFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(startDate: String? = nil, endDate: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "DateRange", "startDate": startDate, "endDate": endDate])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var dateRangeFields: DateRangeFields {
            get {
              return DateRangeFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class GetPalNotificationsForUserQuery: GraphQLQuery {
  public let operationDefinition =
    "query getPalNotificationsForUser($userId: ID!) {\n  getPalNotificationsForUser(userId: $userId) {\n    __typename\n    pal {\n      __typename\n      id\n      activity\n      date {\n        __typename\n        ...dateRangeFields\n      }\n      interested\n    }\n    info {\n      __typename\n      totalCount\n      newInterestCount\n      date\n    }\n  }\n}"

  public let operationName = "getPalNotificationsForUser"

  public var queryDocument: String { return operationDefinition.appending(DateRangeFields.fragmentDefinition) }

  public var userId: GraphQLID

  public init(userId: GraphQLID) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getPalNotificationsForUser", arguments: ["userId": GraphQLVariable("userId")], type: .list(.object(GetPalNotificationsForUser.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getPalNotificationsForUser: [GetPalNotificationsForUser?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getPalNotificationsForUser": getPalNotificationsForUser.flatMap { (value: [GetPalNotificationsForUser?]) -> [ResultMap?] in value.map { (value: GetPalNotificationsForUser?) -> ResultMap? in value.flatMap { (value: GetPalNotificationsForUser) -> ResultMap in value.resultMap } } }])
    }

    public var getPalNotificationsForUser: [GetPalNotificationsForUser?]? {
      get {
        return (resultMap["getPalNotificationsForUser"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [GetPalNotificationsForUser?] in value.map { (value: ResultMap?) -> GetPalNotificationsForUser? in value.flatMap { (value: ResultMap) -> GetPalNotificationsForUser in GetPalNotificationsForUser(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [GetPalNotificationsForUser?]) -> [ResultMap?] in value.map { (value: GetPalNotificationsForUser?) -> ResultMap? in value.flatMap { (value: GetPalNotificationsForUser) -> ResultMap in value.resultMap } } }, forKey: "getPalNotificationsForUser")
      }
    }

    public struct GetPalNotificationsForUser: GraphQLSelectionSet {
      public static let possibleTypes = ["PalNotifications"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("pal", type: .object(Pal.selections)),
        GraphQLField("info", type: .object(Info.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pal: Pal? = nil, info: Info? = nil) {
        self.init(unsafeResultMap: ["__typename": "PalNotifications", "pal": pal.flatMap { (value: Pal) -> ResultMap in value.resultMap }, "info": info.flatMap { (value: Info) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var pal: Pal? {
        get {
          return (resultMap["pal"] as? ResultMap).flatMap { Pal(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "pal")
        }
      }

      public var info: Info? {
        get {
          return (resultMap["info"] as? ResultMap).flatMap { Info(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "info")
        }
      }

      public struct Pal: GraphQLSelectionSet {
        public static let possibleTypes = ["Pal"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("activity", type: .nonNull(.scalar(String.self))),
          GraphQLField("date", type: .object(Date.selections)),
          GraphQLField("interested", type: .list(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, activity: String, date: Date? = nil, interested: [GraphQLID?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "Pal", "id": id, "activity": activity, "date": date.flatMap { (value: Date) -> ResultMap in value.resultMap }, "interested": interested])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var activity: String {
          get {
            return resultMap["activity"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "activity")
          }
        }

        public var date: Date? {
          get {
            return (resultMap["date"] as? ResultMap).flatMap { Date(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "date")
          }
        }

        public var interested: [GraphQLID?]? {
          get {
            return resultMap["interested"] as? [GraphQLID?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "interested")
          }
        }

        public struct Date: GraphQLSelectionSet {
          public static let possibleTypes = ["DateRange"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(DateRangeFields.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(startDate: String? = nil, endDate: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "DateRange", "startDate": startDate, "endDate": endDate])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var dateRangeFields: DateRangeFields {
              get {
                return DateRangeFields(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }

      public struct Info: GraphQLSelectionSet {
        public static let possibleTypes = ["NotificationInfo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalCount", type: .scalar(Int.self)),
          GraphQLField("newInterestCount", type: .scalar(Int.self)),
          GraphQLField("date", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(totalCount: Int? = nil, newInterestCount: Int? = nil, date: String) {
          self.init(unsafeResultMap: ["__typename": "NotificationInfo", "totalCount": totalCount, "newInterestCount": newInterestCount, "date": date])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var totalCount: Int? {
          get {
            return resultMap["totalCount"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalCount")
          }
        }

        public var newInterestCount: Int? {
          get {
            return resultMap["newInterestCount"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "newInterestCount")
          }
        }

        public var date: String {
          get {
            return resultMap["date"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "date")
          }
        }
      }
    }
  }
}

public final class CreateEventMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation createEvent($event: EventInput) {\n  createEvent(event: $event) {\n    __typename\n    id\n    description\n    activity\n    date {\n      __typename\n      ...dateRangeFields\n    }\n    location {\n      __typename\n      ...locationFields\n    }\n    absoluteImage\n  }\n}"

  public let operationName = "createEvent"

  public var queryDocument: String { return operationDefinition.appending(DateRangeFields.fragmentDefinition).appending(LocationFields.fragmentDefinition) }

  public var event: EventInput?

  public init(event: EventInput? = nil) {
    self.event = event
  }

  public var variables: GraphQLMap? {
    return ["event": event]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createEvent", arguments: ["event": GraphQLVariable("event")], type: .object(CreateEvent.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createEvent: CreateEvent? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createEvent": createEvent.flatMap { (value: CreateEvent) -> ResultMap in value.resultMap }])
    }

    public var createEvent: CreateEvent? {
      get {
        return (resultMap["createEvent"] as? ResultMap).flatMap { CreateEvent(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createEvent")
      }
    }

    public struct CreateEvent: GraphQLSelectionSet {
      public static let possibleTypes = ["Event"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("activity", type: .nonNull(.scalar(String.self))),
        GraphQLField("date", type: .object(Date.selections)),
        GraphQLField("location", type: .nonNull(.object(Location.selections))),
        GraphQLField("absoluteImage", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, description: String? = nil, activity: String, date: Date? = nil, location: Location, absoluteImage: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Event", "id": id, "description": description, "activity": activity, "date": date.flatMap { (value: Date) -> ResultMap in value.resultMap }, "location": location.resultMap, "absoluteImage": absoluteImage])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var activity: String {
        get {
          return resultMap["activity"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "activity")
        }
      }

      public var date: Date? {
        get {
          return (resultMap["date"] as? ResultMap).flatMap { Date(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "date")
        }
      }

      public var location: Location {
        get {
          return Location(unsafeResultMap: resultMap["location"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "location")
        }
      }

      public var absoluteImage: String? {
        get {
          return resultMap["absoluteImage"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "absoluteImage")
        }
      }

      public struct Date: GraphQLSelectionSet {
        public static let possibleTypes = ["DateRange"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(DateRangeFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(startDate: String? = nil, endDate: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "DateRange", "startDate": startDate, "endDate": endDate])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var dateRangeFields: DateRangeFields {
            get {
              return DateRangeFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Location: GraphQLSelectionSet {
        public static let possibleTypes = ["Location"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(LocationFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var locationFields: LocationFields {
            get {
              return LocationFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class UpdateEventMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation updateEvent($id: ID!, $patch: EventInput) {\n  updateEvent(id: $id, patch: $patch) {\n    __typename\n    id\n    description\n    activity\n    date {\n      __typename\n      ...dateRangeFields\n    }\n    location {\n      __typename\n      ...locationFields\n    }\n    group {\n      __typename\n      members {\n        __typename\n        id\n        absolutePicture {\n          __typename\n          ...pictureFields\n        }\n      }\n      waitlist {\n        __typename\n        id\n        absolutePicture {\n          __typename\n          ...pictureFields\n        }\n      }\n    }\n    absoluteImage\n  }\n}"

  public let operationName = "updateEvent"

  public var queryDocument: String { return operationDefinition.appending(DateRangeFields.fragmentDefinition).appending(LocationFields.fragmentDefinition).appending(PictureFields.fragmentDefinition) }

  public var id: GraphQLID
  public var patch: EventInput?

  public init(id: GraphQLID, patch: EventInput? = nil) {
    self.id = id
    self.patch = patch
  }

  public var variables: GraphQLMap? {
    return ["id": id, "patch": patch]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateEvent", arguments: ["id": GraphQLVariable("id"), "patch": GraphQLVariable("patch")], type: .object(UpdateEvent.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateEvent: UpdateEvent? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateEvent": updateEvent.flatMap { (value: UpdateEvent) -> ResultMap in value.resultMap }])
    }

    public var updateEvent: UpdateEvent? {
      get {
        return (resultMap["updateEvent"] as? ResultMap).flatMap { UpdateEvent(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateEvent")
      }
    }

    public struct UpdateEvent: GraphQLSelectionSet {
      public static let possibleTypes = ["Event"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("activity", type: .nonNull(.scalar(String.self))),
        GraphQLField("date", type: .object(Date.selections)),
        GraphQLField("location", type: .nonNull(.object(Location.selections))),
        GraphQLField("group", type: .nonNull(.object(Group.selections))),
        GraphQLField("absoluteImage", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, description: String? = nil, activity: String, date: Date? = nil, location: Location, group: Group, absoluteImage: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Event", "id": id, "description": description, "activity": activity, "date": date.flatMap { (value: Date) -> ResultMap in value.resultMap }, "location": location.resultMap, "group": group.resultMap, "absoluteImage": absoluteImage])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var activity: String {
        get {
          return resultMap["activity"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "activity")
        }
      }

      public var date: Date? {
        get {
          return (resultMap["date"] as? ResultMap).flatMap { Date(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "date")
        }
      }

      public var location: Location {
        get {
          return Location(unsafeResultMap: resultMap["location"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "location")
        }
      }

      public var group: Group {
        get {
          return Group(unsafeResultMap: resultMap["group"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "group")
        }
      }

      public var absoluteImage: String? {
        get {
          return resultMap["absoluteImage"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "absoluteImage")
        }
      }

      public struct Date: GraphQLSelectionSet {
        public static let possibleTypes = ["DateRange"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(DateRangeFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(startDate: String? = nil, endDate: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "DateRange", "startDate": startDate, "endDate": endDate])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var dateRangeFields: DateRangeFields {
            get {
              return DateRangeFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Location: GraphQLSelectionSet {
        public static let possibleTypes = ["Location"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(LocationFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var locationFields: LocationFields {
            get {
              return LocationFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Group: GraphQLSelectionSet {
        public static let possibleTypes = ["Group"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("members", type: .list(.object(Member.selections))),
          GraphQLField("waitlist", type: .list(.object(Waitlist.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(members: [Member?]? = nil, waitlist: [Waitlist?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "Group", "members": members.flatMap { (value: [Member?]) -> [ResultMap?] in value.map { (value: Member?) -> ResultMap? in value.flatMap { (value: Member) -> ResultMap in value.resultMap } } }, "waitlist": waitlist.flatMap { (value: [Waitlist?]) -> [ResultMap?] in value.map { (value: Waitlist?) -> ResultMap? in value.flatMap { (value: Waitlist) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var members: [Member?]? {
          get {
            return (resultMap["members"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Member?] in value.map { (value: ResultMap?) -> Member? in value.flatMap { (value: ResultMap) -> Member in Member(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Member?]) -> [ResultMap?] in value.map { (value: Member?) -> ResultMap? in value.flatMap { (value: Member) -> ResultMap in value.resultMap } } }, forKey: "members")
          }
        }

        public var waitlist: [Waitlist?]? {
          get {
            return (resultMap["waitlist"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Waitlist?] in value.map { (value: ResultMap?) -> Waitlist? in value.flatMap { (value: ResultMap) -> Waitlist in Waitlist(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Waitlist?]) -> [ResultMap?] in value.map { (value: Waitlist?) -> ResultMap? in value.flatMap { (value: Waitlist) -> ResultMap in value.resultMap } } }, forKey: "waitlist")
          }
        }

        public struct Member: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("absolutePicture", type: .object(AbsolutePicture.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, absolutePicture: AbsolutePicture? = nil) {
            self.init(unsafeResultMap: ["__typename": "User", "id": id, "absolutePicture": absolutePicture.flatMap { (value: AbsolutePicture) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var absolutePicture: AbsolutePicture? {
            get {
              return (resultMap["absolutePicture"] as? ResultMap).flatMap { AbsolutePicture(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "absolutePicture")
            }
          }

          public struct AbsolutePicture: GraphQLSelectionSet {
            public static let possibleTypes = ["Picture"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(PictureFields.self),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(large: String? = nil, medium: String? = nil, thumbnail: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Picture", "large": large, "medium": medium, "thumbnail": thumbnail])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var pictureFields: PictureFields {
                get {
                  return PictureFields(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }
        }

        public struct Waitlist: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("absolutePicture", type: .object(AbsolutePicture.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, absolutePicture: AbsolutePicture? = nil) {
            self.init(unsafeResultMap: ["__typename": "User", "id": id, "absolutePicture": absolutePicture.flatMap { (value: AbsolutePicture) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var absolutePicture: AbsolutePicture? {
            get {
              return (resultMap["absolutePicture"] as? ResultMap).flatMap { AbsolutePicture(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "absolutePicture")
            }
          }

          public struct AbsolutePicture: GraphQLSelectionSet {
            public static let possibleTypes = ["Picture"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(PictureFields.self),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(large: String? = nil, medium: String? = nil, thumbnail: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Picture", "large": large, "medium": medium, "thumbnail": thumbnail])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var pictureFields: PictureFields {
                get {
                  return PictureFields(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class GetEventsByActivityQuery: GraphQLQuery {
  public let operationDefinition =
    "query getEventsByActivity($userId: ID, $activityFilter: ActivityFilterInput) {\n  getEventsByActivity(userId: $userId, activityFilter: $activityFilter) {\n    __typename\n    id\n    description\n    activity\n    date {\n      __typename\n      ...dateRangeFields\n    }\n    location {\n      __typename\n      ...locationFields\n    }\n    group {\n      __typename\n      members {\n        __typename\n        id\n        absolutePicture {\n          __typename\n          ...pictureFields\n        }\n      }\n      waitlist {\n        __typename\n        id\n        absolutePicture {\n          __typename\n          ...pictureFields\n        }\n      }\n    }\n    absoluteImage\n  }\n}"

  public let operationName = "getEventsByActivity"

  public var queryDocument: String { return operationDefinition.appending(DateRangeFields.fragmentDefinition).appending(LocationFields.fragmentDefinition).appending(PictureFields.fragmentDefinition) }

  public var userId: GraphQLID?
  public var activityFilter: ActivityFilterInput?

  public init(userId: GraphQLID? = nil, activityFilter: ActivityFilterInput? = nil) {
    self.userId = userId
    self.activityFilter = activityFilter
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "activityFilter": activityFilter]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getEventsByActivity", arguments: ["userId": GraphQLVariable("userId"), "activityFilter": GraphQLVariable("activityFilter")], type: .list(.object(GetEventsByActivity.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getEventsByActivity: [GetEventsByActivity?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getEventsByActivity": getEventsByActivity.flatMap { (value: [GetEventsByActivity?]) -> [ResultMap?] in value.map { (value: GetEventsByActivity?) -> ResultMap? in value.flatMap { (value: GetEventsByActivity) -> ResultMap in value.resultMap } } }])
    }

    public var getEventsByActivity: [GetEventsByActivity?]? {
      get {
        return (resultMap["getEventsByActivity"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [GetEventsByActivity?] in value.map { (value: ResultMap?) -> GetEventsByActivity? in value.flatMap { (value: ResultMap) -> GetEventsByActivity in GetEventsByActivity(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [GetEventsByActivity?]) -> [ResultMap?] in value.map { (value: GetEventsByActivity?) -> ResultMap? in value.flatMap { (value: GetEventsByActivity) -> ResultMap in value.resultMap } } }, forKey: "getEventsByActivity")
      }
    }

    public struct GetEventsByActivity: GraphQLSelectionSet {
      public static let possibleTypes = ["Event"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("activity", type: .nonNull(.scalar(String.self))),
        GraphQLField("date", type: .object(Date.selections)),
        GraphQLField("location", type: .nonNull(.object(Location.selections))),
        GraphQLField("group", type: .nonNull(.object(Group.selections))),
        GraphQLField("absoluteImage", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, description: String? = nil, activity: String, date: Date? = nil, location: Location, group: Group, absoluteImage: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Event", "id": id, "description": description, "activity": activity, "date": date.flatMap { (value: Date) -> ResultMap in value.resultMap }, "location": location.resultMap, "group": group.resultMap, "absoluteImage": absoluteImage])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var activity: String {
        get {
          return resultMap["activity"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "activity")
        }
      }

      public var date: Date? {
        get {
          return (resultMap["date"] as? ResultMap).flatMap { Date(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "date")
        }
      }

      public var location: Location {
        get {
          return Location(unsafeResultMap: resultMap["location"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "location")
        }
      }

      public var group: Group {
        get {
          return Group(unsafeResultMap: resultMap["group"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "group")
        }
      }

      public var absoluteImage: String? {
        get {
          return resultMap["absoluteImage"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "absoluteImage")
        }
      }

      public struct Date: GraphQLSelectionSet {
        public static let possibleTypes = ["DateRange"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(DateRangeFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(startDate: String? = nil, endDate: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "DateRange", "startDate": startDate, "endDate": endDate])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var dateRangeFields: DateRangeFields {
            get {
              return DateRangeFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Location: GraphQLSelectionSet {
        public static let possibleTypes = ["Location"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(LocationFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var locationFields: LocationFields {
            get {
              return LocationFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Group: GraphQLSelectionSet {
        public static let possibleTypes = ["Group"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("members", type: .list(.object(Member.selections))),
          GraphQLField("waitlist", type: .list(.object(Waitlist.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(members: [Member?]? = nil, waitlist: [Waitlist?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "Group", "members": members.flatMap { (value: [Member?]) -> [ResultMap?] in value.map { (value: Member?) -> ResultMap? in value.flatMap { (value: Member) -> ResultMap in value.resultMap } } }, "waitlist": waitlist.flatMap { (value: [Waitlist?]) -> [ResultMap?] in value.map { (value: Waitlist?) -> ResultMap? in value.flatMap { (value: Waitlist) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var members: [Member?]? {
          get {
            return (resultMap["members"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Member?] in value.map { (value: ResultMap?) -> Member? in value.flatMap { (value: ResultMap) -> Member in Member(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Member?]) -> [ResultMap?] in value.map { (value: Member?) -> ResultMap? in value.flatMap { (value: Member) -> ResultMap in value.resultMap } } }, forKey: "members")
          }
        }

        public var waitlist: [Waitlist?]? {
          get {
            return (resultMap["waitlist"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Waitlist?] in value.map { (value: ResultMap?) -> Waitlist? in value.flatMap { (value: ResultMap) -> Waitlist in Waitlist(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Waitlist?]) -> [ResultMap?] in value.map { (value: Waitlist?) -> ResultMap? in value.flatMap { (value: Waitlist) -> ResultMap in value.resultMap } } }, forKey: "waitlist")
          }
        }

        public struct Member: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("absolutePicture", type: .object(AbsolutePicture.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, absolutePicture: AbsolutePicture? = nil) {
            self.init(unsafeResultMap: ["__typename": "User", "id": id, "absolutePicture": absolutePicture.flatMap { (value: AbsolutePicture) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var absolutePicture: AbsolutePicture? {
            get {
              return (resultMap["absolutePicture"] as? ResultMap).flatMap { AbsolutePicture(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "absolutePicture")
            }
          }

          public struct AbsolutePicture: GraphQLSelectionSet {
            public static let possibleTypes = ["Picture"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(PictureFields.self),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(large: String? = nil, medium: String? = nil, thumbnail: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Picture", "large": large, "medium": medium, "thumbnail": thumbnail])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var pictureFields: PictureFields {
                get {
                  return PictureFields(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }
        }

        public struct Waitlist: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("absolutePicture", type: .object(AbsolutePicture.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, absolutePicture: AbsolutePicture? = nil) {
            self.init(unsafeResultMap: ["__typename": "User", "id": id, "absolutePicture": absolutePicture.flatMap { (value: AbsolutePicture) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var absolutePicture: AbsolutePicture? {
            get {
              return (resultMap["absolutePicture"] as? ResultMap).flatMap { AbsolutePicture(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "absolutePicture")
            }
          }

          public struct AbsolutePicture: GraphQLSelectionSet {
            public static let possibleTypes = ["Picture"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(PictureFields.self),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(large: String? = nil, medium: String? = nil, thumbnail: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Picture", "large": large, "medium": medium, "thumbnail": thumbnail])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var pictureFields: PictureFields {
                get {
                  return PictureFields(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class GetEventsForUserSortedByDateQuery: GraphQLQuery {
  public let operationDefinition =
    "query getEventsForUserSortedByDate($userId: ID!, $excludeIds: [ID]) {\n  getEventsForUserSortedByDate(userId: $userId, excludeIds: $excludeIds) {\n    __typename\n    id\n    description\n    activity\n    date {\n      __typename\n      ...dateRangeFields\n    }\n    location {\n      __typename\n      ...locationFields\n    }\n    group {\n      __typename\n      members {\n        __typename\n        id\n        absolutePicture {\n          __typename\n          ...pictureFields\n        }\n      }\n      waitlist {\n        __typename\n        id\n        absolutePicture {\n          __typename\n          ...pictureFields\n        }\n      }\n    }\n    absoluteImage\n  }\n}"

  public let operationName = "getEventsForUserSortedByDate"

  public var queryDocument: String { return operationDefinition.appending(DateRangeFields.fragmentDefinition).appending(LocationFields.fragmentDefinition).appending(PictureFields.fragmentDefinition) }

  public var userId: GraphQLID
  public var excludeIds: [GraphQLID?]?

  public init(userId: GraphQLID, excludeIds: [GraphQLID?]? = nil) {
    self.userId = userId
    self.excludeIds = excludeIds
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "excludeIds": excludeIds]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getEventsForUserSortedByDate", arguments: ["userId": GraphQLVariable("userId"), "excludeIds": GraphQLVariable("excludeIds")], type: .list(.object(GetEventsForUserSortedByDate.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getEventsForUserSortedByDate: [GetEventsForUserSortedByDate?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getEventsForUserSortedByDate": getEventsForUserSortedByDate.flatMap { (value: [GetEventsForUserSortedByDate?]) -> [ResultMap?] in value.map { (value: GetEventsForUserSortedByDate?) -> ResultMap? in value.flatMap { (value: GetEventsForUserSortedByDate) -> ResultMap in value.resultMap } } }])
    }

    public var getEventsForUserSortedByDate: [GetEventsForUserSortedByDate?]? {
      get {
        return (resultMap["getEventsForUserSortedByDate"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [GetEventsForUserSortedByDate?] in value.map { (value: ResultMap?) -> GetEventsForUserSortedByDate? in value.flatMap { (value: ResultMap) -> GetEventsForUserSortedByDate in GetEventsForUserSortedByDate(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [GetEventsForUserSortedByDate?]) -> [ResultMap?] in value.map { (value: GetEventsForUserSortedByDate?) -> ResultMap? in value.flatMap { (value: GetEventsForUserSortedByDate) -> ResultMap in value.resultMap } } }, forKey: "getEventsForUserSortedByDate")
      }
    }

    public struct GetEventsForUserSortedByDate: GraphQLSelectionSet {
      public static let possibleTypes = ["Event"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("activity", type: .nonNull(.scalar(String.self))),
        GraphQLField("date", type: .object(Date.selections)),
        GraphQLField("location", type: .nonNull(.object(Location.selections))),
        GraphQLField("group", type: .nonNull(.object(Group.selections))),
        GraphQLField("absoluteImage", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, description: String? = nil, activity: String, date: Date? = nil, location: Location, group: Group, absoluteImage: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Event", "id": id, "description": description, "activity": activity, "date": date.flatMap { (value: Date) -> ResultMap in value.resultMap }, "location": location.resultMap, "group": group.resultMap, "absoluteImage": absoluteImage])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var activity: String {
        get {
          return resultMap["activity"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "activity")
        }
      }

      public var date: Date? {
        get {
          return (resultMap["date"] as? ResultMap).flatMap { Date(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "date")
        }
      }

      public var location: Location {
        get {
          return Location(unsafeResultMap: resultMap["location"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "location")
        }
      }

      public var group: Group {
        get {
          return Group(unsafeResultMap: resultMap["group"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "group")
        }
      }

      public var absoluteImage: String? {
        get {
          return resultMap["absoluteImage"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "absoluteImage")
        }
      }

      public struct Date: GraphQLSelectionSet {
        public static let possibleTypes = ["DateRange"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(DateRangeFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(startDate: String? = nil, endDate: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "DateRange", "startDate": startDate, "endDate": endDate])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var dateRangeFields: DateRangeFields {
            get {
              return DateRangeFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Location: GraphQLSelectionSet {
        public static let possibleTypes = ["Location"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(LocationFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var locationFields: LocationFields {
            get {
              return LocationFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Group: GraphQLSelectionSet {
        public static let possibleTypes = ["Group"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("members", type: .list(.object(Member.selections))),
          GraphQLField("waitlist", type: .list(.object(Waitlist.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(members: [Member?]? = nil, waitlist: [Waitlist?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "Group", "members": members.flatMap { (value: [Member?]) -> [ResultMap?] in value.map { (value: Member?) -> ResultMap? in value.flatMap { (value: Member) -> ResultMap in value.resultMap } } }, "waitlist": waitlist.flatMap { (value: [Waitlist?]) -> [ResultMap?] in value.map { (value: Waitlist?) -> ResultMap? in value.flatMap { (value: Waitlist) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var members: [Member?]? {
          get {
            return (resultMap["members"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Member?] in value.map { (value: ResultMap?) -> Member? in value.flatMap { (value: ResultMap) -> Member in Member(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Member?]) -> [ResultMap?] in value.map { (value: Member?) -> ResultMap? in value.flatMap { (value: Member) -> ResultMap in value.resultMap } } }, forKey: "members")
          }
        }

        public var waitlist: [Waitlist?]? {
          get {
            return (resultMap["waitlist"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Waitlist?] in value.map { (value: ResultMap?) -> Waitlist? in value.flatMap { (value: ResultMap) -> Waitlist in Waitlist(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Waitlist?]) -> [ResultMap?] in value.map { (value: Waitlist?) -> ResultMap? in value.flatMap { (value: Waitlist) -> ResultMap in value.resultMap } } }, forKey: "waitlist")
          }
        }

        public struct Member: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("absolutePicture", type: .object(AbsolutePicture.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, absolutePicture: AbsolutePicture? = nil) {
            self.init(unsafeResultMap: ["__typename": "User", "id": id, "absolutePicture": absolutePicture.flatMap { (value: AbsolutePicture) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var absolutePicture: AbsolutePicture? {
            get {
              return (resultMap["absolutePicture"] as? ResultMap).flatMap { AbsolutePicture(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "absolutePicture")
            }
          }

          public struct AbsolutePicture: GraphQLSelectionSet {
            public static let possibleTypes = ["Picture"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(PictureFields.self),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(large: String? = nil, medium: String? = nil, thumbnail: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Picture", "large": large, "medium": medium, "thumbnail": thumbnail])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var pictureFields: PictureFields {
                get {
                  return PictureFields(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }
        }

        public struct Waitlist: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("absolutePicture", type: .object(AbsolutePicture.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, absolutePicture: AbsolutePicture? = nil) {
            self.init(unsafeResultMap: ["__typename": "User", "id": id, "absolutePicture": absolutePicture.flatMap { (value: AbsolutePicture) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var absolutePicture: AbsolutePicture? {
            get {
              return (resultMap["absolutePicture"] as? ResultMap).flatMap { AbsolutePicture(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "absolutePicture")
            }
          }

          public struct AbsolutePicture: GraphQLSelectionSet {
            public static let possibleTypes = ["Picture"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(PictureFields.self),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(large: String? = nil, medium: String? = nil, thumbnail: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Picture", "large": large, "medium": medium, "thumbnail": thumbnail])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var pictureFields: PictureFields {
                get {
                  return PictureFields(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class GetEventNotificationsForUserQuery: GraphQLQuery {
  public let operationDefinition =
    "query getEventNotificationsForUser($userId: ID!) {\n  getEventNotificationsForUser(userId: $userId) {\n    __typename\n    event {\n      __typename\n      id\n      description\n      activity\n      date {\n        __typename\n        ...dateRangeFields\n      }\n      location {\n        __typename\n        ...locationFields\n      }\n      group {\n        __typename\n        members {\n          __typename\n          id\n          absolutePicture {\n            __typename\n            ...pictureFields\n          }\n        }\n        waitlist {\n          __typename\n          id\n          absolutePicture {\n            __typename\n            ...pictureFields\n          }\n        }\n      }\n      absoluteImage\n    }\n    info {\n      __typename\n      totalCount\n      new\n      newMessageCount\n      newInterestCount\n      date\n    }\n  }\n}"

  public let operationName = "getEventNotificationsForUser"

  public var queryDocument: String { return operationDefinition.appending(DateRangeFields.fragmentDefinition).appending(LocationFields.fragmentDefinition).appending(PictureFields.fragmentDefinition) }

  public var userId: GraphQLID

  public init(userId: GraphQLID) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getEventNotificationsForUser", arguments: ["userId": GraphQLVariable("userId")], type: .list(.object(GetEventNotificationsForUser.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getEventNotificationsForUser: [GetEventNotificationsForUser?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getEventNotificationsForUser": getEventNotificationsForUser.flatMap { (value: [GetEventNotificationsForUser?]) -> [ResultMap?] in value.map { (value: GetEventNotificationsForUser?) -> ResultMap? in value.flatMap { (value: GetEventNotificationsForUser) -> ResultMap in value.resultMap } } }])
    }

    public var getEventNotificationsForUser: [GetEventNotificationsForUser?]? {
      get {
        return (resultMap["getEventNotificationsForUser"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [GetEventNotificationsForUser?] in value.map { (value: ResultMap?) -> GetEventNotificationsForUser? in value.flatMap { (value: ResultMap) -> GetEventNotificationsForUser in GetEventNotificationsForUser(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [GetEventNotificationsForUser?]) -> [ResultMap?] in value.map { (value: GetEventNotificationsForUser?) -> ResultMap? in value.flatMap { (value: GetEventNotificationsForUser) -> ResultMap in value.resultMap } } }, forKey: "getEventNotificationsForUser")
      }
    }

    public struct GetEventNotificationsForUser: GraphQLSelectionSet {
      public static let possibleTypes = ["EventNotifications"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("event", type: .object(Event.selections)),
        GraphQLField("info", type: .object(Info.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(event: Event? = nil, info: Info? = nil) {
        self.init(unsafeResultMap: ["__typename": "EventNotifications", "event": event.flatMap { (value: Event) -> ResultMap in value.resultMap }, "info": info.flatMap { (value: Info) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var event: Event? {
        get {
          return (resultMap["event"] as? ResultMap).flatMap { Event(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "event")
        }
      }

      public var info: Info? {
        get {
          return (resultMap["info"] as? ResultMap).flatMap { Info(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "info")
        }
      }

      public struct Event: GraphQLSelectionSet {
        public static let possibleTypes = ["Event"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("activity", type: .nonNull(.scalar(String.self))),
          GraphQLField("date", type: .object(Date.selections)),
          GraphQLField("location", type: .nonNull(.object(Location.selections))),
          GraphQLField("group", type: .nonNull(.object(Group.selections))),
          GraphQLField("absoluteImage", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, description: String? = nil, activity: String, date: Date? = nil, location: Location, group: Group, absoluteImage: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Event", "id": id, "description": description, "activity": activity, "date": date.flatMap { (value: Date) -> ResultMap in value.resultMap }, "location": location.resultMap, "group": group.resultMap, "absoluteImage": absoluteImage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        public var activity: String {
          get {
            return resultMap["activity"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "activity")
          }
        }

        public var date: Date? {
          get {
            return (resultMap["date"] as? ResultMap).flatMap { Date(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "date")
          }
        }

        public var location: Location {
          get {
            return Location(unsafeResultMap: resultMap["location"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "location")
          }
        }

        public var group: Group {
          get {
            return Group(unsafeResultMap: resultMap["group"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "group")
          }
        }

        public var absoluteImage: String? {
          get {
            return resultMap["absoluteImage"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "absoluteImage")
          }
        }

        public struct Date: GraphQLSelectionSet {
          public static let possibleTypes = ["DateRange"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(DateRangeFields.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(startDate: String? = nil, endDate: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "DateRange", "startDate": startDate, "endDate": endDate])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var dateRangeFields: DateRangeFields {
              get {
                return DateRangeFields(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }

        public struct Location: GraphQLSelectionSet {
          public static let possibleTypes = ["Location"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(LocationFields.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var locationFields: LocationFields {
              get {
                return LocationFields(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }

        public struct Group: GraphQLSelectionSet {
          public static let possibleTypes = ["Group"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("members", type: .list(.object(Member.selections))),
            GraphQLField("waitlist", type: .list(.object(Waitlist.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(members: [Member?]? = nil, waitlist: [Waitlist?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "Group", "members": members.flatMap { (value: [Member?]) -> [ResultMap?] in value.map { (value: Member?) -> ResultMap? in value.flatMap { (value: Member) -> ResultMap in value.resultMap } } }, "waitlist": waitlist.flatMap { (value: [Waitlist?]) -> [ResultMap?] in value.map { (value: Waitlist?) -> ResultMap? in value.flatMap { (value: Waitlist) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var members: [Member?]? {
            get {
              return (resultMap["members"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Member?] in value.map { (value: ResultMap?) -> Member? in value.flatMap { (value: ResultMap) -> Member in Member(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Member?]) -> [ResultMap?] in value.map { (value: Member?) -> ResultMap? in value.flatMap { (value: Member) -> ResultMap in value.resultMap } } }, forKey: "members")
            }
          }

          public var waitlist: [Waitlist?]? {
            get {
              return (resultMap["waitlist"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Waitlist?] in value.map { (value: ResultMap?) -> Waitlist? in value.flatMap { (value: ResultMap) -> Waitlist in Waitlist(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Waitlist?]) -> [ResultMap?] in value.map { (value: Waitlist?) -> ResultMap? in value.flatMap { (value: Waitlist) -> ResultMap in value.resultMap } } }, forKey: "waitlist")
            }
          }

          public struct Member: GraphQLSelectionSet {
            public static let possibleTypes = ["User"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("absolutePicture", type: .object(AbsolutePicture.selections)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, absolutePicture: AbsolutePicture? = nil) {
              self.init(unsafeResultMap: ["__typename": "User", "id": id, "absolutePicture": absolutePicture.flatMap { (value: AbsolutePicture) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var absolutePicture: AbsolutePicture? {
              get {
                return (resultMap["absolutePicture"] as? ResultMap).flatMap { AbsolutePicture(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "absolutePicture")
              }
            }

            public struct AbsolutePicture: GraphQLSelectionSet {
              public static let possibleTypes = ["Picture"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLFragmentSpread(PictureFields.self),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(large: String? = nil, medium: String? = nil, thumbnail: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Picture", "large": large, "medium": medium, "thumbnail": thumbnail])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var fragments: Fragments {
                get {
                  return Fragments(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }

              public struct Fragments {
                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public var pictureFields: PictureFields {
                  get {
                    return PictureFields(unsafeResultMap: resultMap)
                  }
                  set {
                    resultMap += newValue.resultMap
                  }
                }
              }
            }
          }

          public struct Waitlist: GraphQLSelectionSet {
            public static let possibleTypes = ["User"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("absolutePicture", type: .object(AbsolutePicture.selections)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, absolutePicture: AbsolutePicture? = nil) {
              self.init(unsafeResultMap: ["__typename": "User", "id": id, "absolutePicture": absolutePicture.flatMap { (value: AbsolutePicture) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var absolutePicture: AbsolutePicture? {
              get {
                return (resultMap["absolutePicture"] as? ResultMap).flatMap { AbsolutePicture(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "absolutePicture")
              }
            }

            public struct AbsolutePicture: GraphQLSelectionSet {
              public static let possibleTypes = ["Picture"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLFragmentSpread(PictureFields.self),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(large: String? = nil, medium: String? = nil, thumbnail: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Picture", "large": large, "medium": medium, "thumbnail": thumbnail])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var fragments: Fragments {
                get {
                  return Fragments(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }

              public struct Fragments {
                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public var pictureFields: PictureFields {
                  get {
                    return PictureFields(unsafeResultMap: resultMap)
                  }
                  set {
                    resultMap += newValue.resultMap
                  }
                }
              }
            }
          }
        }
      }

      public struct Info: GraphQLSelectionSet {
        public static let possibleTypes = ["NotificationInfo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalCount", type: .scalar(Int.self)),
          GraphQLField("new", type: .scalar(Bool.self)),
          GraphQLField("newMessageCount", type: .scalar(Int.self)),
          GraphQLField("newInterestCount", type: .scalar(Int.self)),
          GraphQLField("date", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(totalCount: Int? = nil, new: Bool? = nil, newMessageCount: Int? = nil, newInterestCount: Int? = nil, date: String) {
          self.init(unsafeResultMap: ["__typename": "NotificationInfo", "totalCount": totalCount, "new": new, "newMessageCount": newMessageCount, "newInterestCount": newInterestCount, "date": date])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var totalCount: Int? {
          get {
            return resultMap["totalCount"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalCount")
          }
        }

        public var new: Bool? {
          get {
            return resultMap["new"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "new")
          }
        }

        public var newMessageCount: Int? {
          get {
            return resultMap["newMessageCount"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "newMessageCount")
          }
        }

        public var newInterestCount: Int? {
          get {
            return resultMap["newInterestCount"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "newInterestCount")
          }
        }

        public var date: String {
          get {
            return resultMap["date"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "date")
          }
        }
      }
    }
  }
}

public final class GetEventConversationQuery: GraphQLQuery {
  public let operationDefinition =
    "query getEventConversation($eventId: ID!) {\n  getEventConversation(eventId: $eventId) {\n    __typename\n    id\n    group {\n      __typename\n      conversation {\n        __typename\n        id\n        from {\n          __typename\n          id\n          name {\n            __typename\n            ...nameFields\n          }\n          absolutePicture {\n            __typename\n            ...pictureFields\n          }\n        }\n        to\n        type\n        content {\n          __typename\n          timestamp\n          text\n        }\n      }\n    }\n  }\n}"

  public let operationName = "getEventConversation"

  public var queryDocument: String { return operationDefinition.appending(NameFields.fragmentDefinition).appending(PictureFields.fragmentDefinition) }

  public var eventId: GraphQLID

  public init(eventId: GraphQLID) {
    self.eventId = eventId
  }

  public var variables: GraphQLMap? {
    return ["eventId": eventId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getEventConversation", arguments: ["eventId": GraphQLVariable("eventId")], type: .object(GetEventConversation.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getEventConversation: GetEventConversation? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getEventConversation": getEventConversation.flatMap { (value: GetEventConversation) -> ResultMap in value.resultMap }])
    }

    public var getEventConversation: GetEventConversation? {
      get {
        return (resultMap["getEventConversation"] as? ResultMap).flatMap { GetEventConversation(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "getEventConversation")
      }
    }

    public struct GetEventConversation: GraphQLSelectionSet {
      public static let possibleTypes = ["Event"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("group", type: .nonNull(.object(Group.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, group: Group) {
        self.init(unsafeResultMap: ["__typename": "Event", "id": id, "group": group.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var group: Group {
        get {
          return Group(unsafeResultMap: resultMap["group"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "group")
        }
      }

      public struct Group: GraphQLSelectionSet {
        public static let possibleTypes = ["Group"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conversation", type: .list(.object(Conversation.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(conversation: [Conversation?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "Group", "conversation": conversation.flatMap { (value: [Conversation?]) -> [ResultMap?] in value.map { (value: Conversation?) -> ResultMap? in value.flatMap { (value: Conversation) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var conversation: [Conversation?]? {
          get {
            return (resultMap["conversation"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Conversation?] in value.map { (value: ResultMap?) -> Conversation? in value.flatMap { (value: ResultMap) -> Conversation in Conversation(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Conversation?]) -> [ResultMap?] in value.map { (value: Conversation?) -> ResultMap? in value.flatMap { (value: Conversation) -> ResultMap in value.resultMap } } }, forKey: "conversation")
          }
        }

        public struct Conversation: GraphQLSelectionSet {
          public static let possibleTypes = ["Message"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("from", type: .object(From.selections)),
            GraphQLField("to", type: .scalar(GraphQLID.self)),
            GraphQLField("type", type: .scalar(MessageType.self)),
            GraphQLField("content", type: .object(Content.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, from: From? = nil, to: GraphQLID? = nil, type: MessageType? = nil, content: Content? = nil) {
            self.init(unsafeResultMap: ["__typename": "Message", "id": id, "from": from.flatMap { (value: From) -> ResultMap in value.resultMap }, "to": to, "type": type, "content": content.flatMap { (value: Content) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var from: From? {
            get {
              return (resultMap["from"] as? ResultMap).flatMap { From(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "from")
            }
          }

          public var to: GraphQLID? {
            get {
              return resultMap["to"] as? GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "to")
            }
          }

          public var type: MessageType? {
            get {
              return resultMap["type"] as? MessageType
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public var content: Content? {
            get {
              return (resultMap["content"] as? ResultMap).flatMap { Content(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "content")
            }
          }

          public struct From: GraphQLSelectionSet {
            public static let possibleTypes = ["User"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .nonNull(.object(Name.selections))),
              GraphQLField("absolutePicture", type: .object(AbsolutePicture.selections)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, name: Name, absolutePicture: AbsolutePicture? = nil) {
              self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name.resultMap, "absolutePicture": absolutePicture.flatMap { (value: AbsolutePicture) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: Name {
              get {
                return Name(unsafeResultMap: resultMap["name"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "name")
              }
            }

            public var absolutePicture: AbsolutePicture? {
              get {
                return (resultMap["absolutePicture"] as? ResultMap).flatMap { AbsolutePicture(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "absolutePicture")
              }
            }

            public struct Name: GraphQLSelectionSet {
              public static let possibleTypes = ["Name"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLFragmentSpread(NameFields.self),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(first: String, last: String) {
                self.init(unsafeResultMap: ["__typename": "Name", "first": first, "last": last])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var fragments: Fragments {
                get {
                  return Fragments(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }

              public struct Fragments {
                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public var nameFields: NameFields {
                  get {
                    return NameFields(unsafeResultMap: resultMap)
                  }
                  set {
                    resultMap += newValue.resultMap
                  }
                }
              }
            }

            public struct AbsolutePicture: GraphQLSelectionSet {
              public static let possibleTypes = ["Picture"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLFragmentSpread(PictureFields.self),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(large: String? = nil, medium: String? = nil, thumbnail: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Picture", "large": large, "medium": medium, "thumbnail": thumbnail])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var fragments: Fragments {
                get {
                  return Fragments(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }

              public struct Fragments {
                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public var pictureFields: PictureFields {
                  get {
                    return PictureFields(unsafeResultMap: resultMap)
                  }
                  set {
                    resultMap += newValue.resultMap
                  }
                }
              }
            }
          }

          public struct Content: GraphQLSelectionSet {
            public static let possibleTypes = ["MessageContent"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("timestamp", type: .scalar(String.self)),
              GraphQLField("text", type: .scalar(String.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(timestamp: String? = nil, text: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "MessageContent", "timestamp": timestamp, "text": text])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var timestamp: String? {
              get {
                return resultMap["timestamp"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "timestamp")
              }
            }

            public var text: String? {
              get {
                return resultMap["text"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "text")
              }
            }
          }
        }
      }
    }
  }
}

public final class GetEventMembersQuery: GraphQLQuery {
  public let operationDefinition =
    "query getEventMembers($eventId: ID!) {\n  getEventMembers(eventId: $eventId) {\n    __typename\n    id\n    name {\n      __typename\n      ...nameFields\n    }\n    absolutePicture {\n      __typename\n      ...pictureFields\n    }\n    gender\n    dob\n    location {\n      __typename\n      ...locationFields\n    }\n  }\n}"

  public let operationName = "getEventMembers"

  public var queryDocument: String { return operationDefinition.appending(NameFields.fragmentDefinition).appending(PictureFields.fragmentDefinition).appending(LocationFields.fragmentDefinition) }

  public var eventId: GraphQLID

  public init(eventId: GraphQLID) {
    self.eventId = eventId
  }

  public var variables: GraphQLMap? {
    return ["eventId": eventId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getEventMembers", arguments: ["eventId": GraphQLVariable("eventId")], type: .list(.object(GetEventMember.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getEventMembers: [GetEventMember?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getEventMembers": getEventMembers.flatMap { (value: [GetEventMember?]) -> [ResultMap?] in value.map { (value: GetEventMember?) -> ResultMap? in value.flatMap { (value: GetEventMember) -> ResultMap in value.resultMap } } }])
    }

    public var getEventMembers: [GetEventMember?]? {
      get {
        return (resultMap["getEventMembers"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [GetEventMember?] in value.map { (value: ResultMap?) -> GetEventMember? in value.flatMap { (value: ResultMap) -> GetEventMember in GetEventMember(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [GetEventMember?]) -> [ResultMap?] in value.map { (value: GetEventMember?) -> ResultMap? in value.flatMap { (value: GetEventMember) -> ResultMap in value.resultMap } } }, forKey: "getEventMembers")
      }
    }

    public struct GetEventMember: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.object(Name.selections))),
        GraphQLField("absolutePicture", type: .object(AbsolutePicture.selections)),
        GraphQLField("gender", type: .nonNull(.scalar(Gender.self))),
        GraphQLField("dob", type: .nonNull(.scalar(String.self))),
        GraphQLField("location", type: .object(Location.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: Name, absolutePicture: AbsolutePicture? = nil, gender: Gender, dob: String, location: Location? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name.resultMap, "absolutePicture": absolutePicture.flatMap { (value: AbsolutePicture) -> ResultMap in value.resultMap }, "gender": gender, "dob": dob, "location": location.flatMap { (value: Location) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: Name {
        get {
          return Name(unsafeResultMap: resultMap["name"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "name")
        }
      }

      public var absolutePicture: AbsolutePicture? {
        get {
          return (resultMap["absolutePicture"] as? ResultMap).flatMap { AbsolutePicture(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "absolutePicture")
        }
      }

      public var gender: Gender {
        get {
          return resultMap["gender"]! as! Gender
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }

      public var dob: String {
        get {
          return resultMap["dob"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "dob")
        }
      }

      public var location: Location? {
        get {
          return (resultMap["location"] as? ResultMap).flatMap { Location(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "location")
        }
      }

      public struct Name: GraphQLSelectionSet {
        public static let possibleTypes = ["Name"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(NameFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(first: String, last: String) {
          self.init(unsafeResultMap: ["__typename": "Name", "first": first, "last": last])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var nameFields: NameFields {
            get {
              return NameFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct AbsolutePicture: GraphQLSelectionSet {
        public static let possibleTypes = ["Picture"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(PictureFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(large: String? = nil, medium: String? = nil, thumbnail: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Picture", "large": large, "medium": medium, "thumbnail": thumbnail])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var pictureFields: PictureFields {
            get {
              return PictureFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Location: GraphQLSelectionSet {
        public static let possibleTypes = ["Location"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(LocationFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var locationFields: LocationFields {
            get {
              return LocationFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class GetEventWaitlistQuery: GraphQLQuery {
  public let operationDefinition =
    "query getEventWaitlist($eventId: ID!) {\n  getEventWaitlist(eventId: $eventId) {\n    __typename\n    id\n    name {\n      __typename\n      ...nameFields\n    }\n    absolutePicture {\n      __typename\n      ...pictureFields\n    }\n    gender\n    dob\n    location {\n      __typename\n      ...locationFields\n    }\n  }\n}"

  public let operationName = "getEventWaitlist"

  public var queryDocument: String { return operationDefinition.appending(NameFields.fragmentDefinition).appending(PictureFields.fragmentDefinition).appending(LocationFields.fragmentDefinition) }

  public var eventId: GraphQLID

  public init(eventId: GraphQLID) {
    self.eventId = eventId
  }

  public var variables: GraphQLMap? {
    return ["eventId": eventId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getEventWaitlist", arguments: ["eventId": GraphQLVariable("eventId")], type: .list(.object(GetEventWaitlist.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getEventWaitlist: [GetEventWaitlist?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getEventWaitlist": getEventWaitlist.flatMap { (value: [GetEventWaitlist?]) -> [ResultMap?] in value.map { (value: GetEventWaitlist?) -> ResultMap? in value.flatMap { (value: GetEventWaitlist) -> ResultMap in value.resultMap } } }])
    }

    public var getEventWaitlist: [GetEventWaitlist?]? {
      get {
        return (resultMap["getEventWaitlist"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [GetEventWaitlist?] in value.map { (value: ResultMap?) -> GetEventWaitlist? in value.flatMap { (value: ResultMap) -> GetEventWaitlist in GetEventWaitlist(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [GetEventWaitlist?]) -> [ResultMap?] in value.map { (value: GetEventWaitlist?) -> ResultMap? in value.flatMap { (value: GetEventWaitlist) -> ResultMap in value.resultMap } } }, forKey: "getEventWaitlist")
      }
    }

    public struct GetEventWaitlist: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.object(Name.selections))),
        GraphQLField("absolutePicture", type: .object(AbsolutePicture.selections)),
        GraphQLField("gender", type: .nonNull(.scalar(Gender.self))),
        GraphQLField("dob", type: .nonNull(.scalar(String.self))),
        GraphQLField("location", type: .object(Location.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: Name, absolutePicture: AbsolutePicture? = nil, gender: Gender, dob: String, location: Location? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name.resultMap, "absolutePicture": absolutePicture.flatMap { (value: AbsolutePicture) -> ResultMap in value.resultMap }, "gender": gender, "dob": dob, "location": location.flatMap { (value: Location) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: Name {
        get {
          return Name(unsafeResultMap: resultMap["name"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "name")
        }
      }

      public var absolutePicture: AbsolutePicture? {
        get {
          return (resultMap["absolutePicture"] as? ResultMap).flatMap { AbsolutePicture(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "absolutePicture")
        }
      }

      public var gender: Gender {
        get {
          return resultMap["gender"]! as! Gender
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }

      public var dob: String {
        get {
          return resultMap["dob"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "dob")
        }
      }

      public var location: Location? {
        get {
          return (resultMap["location"] as? ResultMap).flatMap { Location(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "location")
        }
      }

      public struct Name: GraphQLSelectionSet {
        public static let possibleTypes = ["Name"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(NameFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(first: String, last: String) {
          self.init(unsafeResultMap: ["__typename": "Name", "first": first, "last": last])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var nameFields: NameFields {
            get {
              return NameFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct AbsolutePicture: GraphQLSelectionSet {
        public static let possibleTypes = ["Picture"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(PictureFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(large: String? = nil, medium: String? = nil, thumbnail: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Picture", "large": large, "medium": medium, "thumbnail": thumbnail])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var pictureFields: PictureFields {
            get {
              return PictureFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Location: GraphQLSelectionSet {
        public static let possibleTypes = ["Location"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(LocationFields.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var locationFields: LocationFields {
            get {
              return LocationFields(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class GetNotificationCountsForUserQuery: GraphQLQuery {
  public let operationDefinition =
    "query getNotificationCountsForUser($userId: ID!) {\n  getNotificationCountsForUser(userId: $userId) {\n    __typename\n    event\n    pal\n  }\n}"

  public let operationName = "getNotificationCountsForUser"

  public var userId: GraphQLID

  public init(userId: GraphQLID) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getNotificationCountsForUser", arguments: ["userId": GraphQLVariable("userId")], type: .object(GetNotificationCountsForUser.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getNotificationCountsForUser: GetNotificationCountsForUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getNotificationCountsForUser": getNotificationCountsForUser.flatMap { (value: GetNotificationCountsForUser) -> ResultMap in value.resultMap }])
    }

    public var getNotificationCountsForUser: GetNotificationCountsForUser? {
      get {
        return (resultMap["getNotificationCountsForUser"] as? ResultMap).flatMap { GetNotificationCountsForUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "getNotificationCountsForUser")
      }
    }

    public struct GetNotificationCountsForUser: GraphQLSelectionSet {
      public static let possibleTypes = ["NotificationCounts"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("event", type: .scalar(Int.self)),
        GraphQLField("pal", type: .scalar(Int.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(event: Int? = nil, pal: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "NotificationCounts", "event": event, "pal": pal])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var event: Int? {
        get {
          return resultMap["event"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "event")
        }
      }

      public var pal: Int? {
        get {
          return resultMap["pal"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "pal")
        }
      }
    }
  }
}

public final class MarkEventNotificationsAsSeenMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation markEventNotificationsAsSeen($userId: ID!, $eventId: ID!) {\n  markEventNotificationsAsSeen(userId: $userId, eventId: $eventId)\n}"

  public let operationName = "markEventNotificationsAsSeen"

  public var userId: GraphQLID
  public var eventId: GraphQLID

  public init(userId: GraphQLID, eventId: GraphQLID) {
    self.userId = userId
    self.eventId = eventId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "eventId": eventId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("markEventNotificationsAsSeen", arguments: ["userId": GraphQLVariable("userId"), "eventId": GraphQLVariable("eventId")], type: .scalar(Int.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(markEventNotificationsAsSeen: Int? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "markEventNotificationsAsSeen": markEventNotificationsAsSeen])
    }

    public var markEventNotificationsAsSeen: Int? {
      get {
        return resultMap["markEventNotificationsAsSeen"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "markEventNotificationsAsSeen")
      }
    }
  }
}

public final class MarkPalNotificationsAsSeenMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation markPalNotificationsAsSeen($userId: ID!, $palId: ID!) {\n  markPalNotificationsAsSeen(userId: $userId, palId: $palId)\n}"

  public let operationName = "markPalNotificationsAsSeen"

  public var userId: GraphQLID
  public var palId: GraphQLID

  public init(userId: GraphQLID, palId: GraphQLID) {
    self.userId = userId
    self.palId = palId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "palId": palId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("markPalNotificationsAsSeen", arguments: ["userId": GraphQLVariable("userId"), "palId": GraphQLVariable("palId")], type: .scalar(Int.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(markPalNotificationsAsSeen: Int? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "markPalNotificationsAsSeen": markPalNotificationsAsSeen])
    }

    public var markPalNotificationsAsSeen: Int? {
      get {
        return resultMap["markPalNotificationsAsSeen"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "markPalNotificationsAsSeen")
      }
    }
  }
}

public final class SendMessageMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation sendMessage($message: MessageInput) {\n  sendMessage(message: $message)\n}"

  public let operationName = "sendMessage"

  public var message: MessageInput?

  public init(message: MessageInput? = nil) {
    self.message = message
  }

  public var variables: GraphQLMap? {
    return ["message": message]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("sendMessage", arguments: ["message": GraphQLVariable("message")], type: .scalar(GraphQLID.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sendMessage: GraphQLID? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "sendMessage": sendMessage])
    }

    public var sendMessage: GraphQLID? {
      get {
        return resultMap["sendMessage"] as? GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "sendMessage")
      }
    }
  }
}

public struct LocationFields: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment locationFields on Location {\n  __typename\n  address\n  city\n  state\n  coordinates {\n    __typename\n    latitude\n    longitude\n  }\n  radius\n}"

  public static let possibleTypes = ["Location"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("address", type: .scalar(String.self)),
    GraphQLField("city", type: .scalar(String.self)),
    GraphQLField("state", type: .scalar(String.self)),
    GraphQLField("coordinates", type: .object(Coordinate.selections)),
    GraphQLField("radius", type: .scalar(Int.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(address: String? = nil, city: String? = nil, state: String? = nil, coordinates: Coordinate? = nil, radius: Int? = nil) {
    self.init(unsafeResultMap: ["__typename": "Location", "address": address, "city": city, "state": state, "coordinates": coordinates.flatMap { (value: Coordinate) -> ResultMap in value.resultMap }, "radius": radius])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var address: String? {
    get {
      return resultMap["address"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "address")
    }
  }

  public var city: String? {
    get {
      return resultMap["city"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "city")
    }
  }

  public var state: String? {
    get {
      return resultMap["state"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "state")
    }
  }

  public var coordinates: Coordinate? {
    get {
      return (resultMap["coordinates"] as? ResultMap).flatMap { Coordinate(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "coordinates")
    }
  }

  public var radius: Int? {
    get {
      return resultMap["radius"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "radius")
    }
  }

  public struct Coordinate: GraphQLSelectionSet {
    public static let possibleTypes = ["Coordinates"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("latitude", type: .nonNull(.scalar(Double.self))),
      GraphQLField("longitude", type: .nonNull(.scalar(Double.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(latitude: Double, longitude: Double) {
      self.init(unsafeResultMap: ["__typename": "Coordinates", "latitude": latitude, "longitude": longitude])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var latitude: Double {
      get {
        return resultMap["latitude"]! as! Double
      }
      set {
        resultMap.updateValue(newValue, forKey: "latitude")
      }
    }

    public var longitude: Double {
      get {
        return resultMap["longitude"]! as! Double
      }
      set {
        resultMap.updateValue(newValue, forKey: "longitude")
      }
    }
  }
}

public struct DateRangeFields: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment dateRangeFields on DateRange {\n  __typename\n  startDate\n  endDate\n}"

  public static let possibleTypes = ["DateRange"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("startDate", type: .scalar(String.self)),
    GraphQLField("endDate", type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(startDate: String? = nil, endDate: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "DateRange", "startDate": startDate, "endDate": endDate])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var startDate: String? {
    get {
      return resultMap["startDate"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "startDate")
    }
  }

  public var endDate: String? {
    get {
      return resultMap["endDate"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "endDate")
    }
  }
}

public struct NameFields: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment nameFields on Name {\n  __typename\n  first\n  last\n}"

  public static let possibleTypes = ["Name"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("first", type: .nonNull(.scalar(String.self))),
    GraphQLField("last", type: .nonNull(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(first: String, last: String) {
    self.init(unsafeResultMap: ["__typename": "Name", "first": first, "last": last])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var first: String {
    get {
      return resultMap["first"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "first")
    }
  }

  public var last: String {
    get {
      return resultMap["last"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "last")
    }
  }
}

public struct PictureFields: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment pictureFields on Picture {\n  __typename\n  large\n  medium\n  thumbnail\n}"

  public static let possibleTypes = ["Picture"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("large", type: .scalar(String.self)),
    GraphQLField("medium", type: .scalar(String.self)),
    GraphQLField("thumbnail", type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(large: String? = nil, medium: String? = nil, thumbnail: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "Picture", "large": large, "medium": medium, "thumbnail": thumbnail])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var large: String? {
    get {
      return resultMap["large"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "large")
    }
  }

  public var medium: String? {
    get {
      return resultMap["medium"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "medium")
    }
  }

  public var thumbnail: String? {
    get {
      return resultMap["thumbnail"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "thumbnail")
    }
  }
}

public struct EducationFields: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment educationFields on Education {\n  __typename\n  school\n  classOf: class\n}"

  public static let possibleTypes = ["Education"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("school", type: .scalar(String.self)),
    GraphQLField("class", alias: "classOf", type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(school: String? = nil, classOf: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "Education", "school": school, "classOf": classOf])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var school: String? {
    get {
      return resultMap["school"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "school")
    }
  }

  public var classOf: String? {
    get {
      return resultMap["classOf"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "classOf")
    }
  }
}

public struct WorkFields: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment workFields on Work {\n  __typename\n  organization\n  title\n}"

  public static let possibleTypes = ["Work"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("organization", type: .scalar(String.self)),
    GraphQLField("title", type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(organization: String? = nil, title: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "Work", "organization": organization, "title": title])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var organization: String? {
    get {
      return resultMap["organization"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "organization")
    }
  }

  public var title: String? {
    get {
      return resultMap["title"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "title")
    }
  }
}
