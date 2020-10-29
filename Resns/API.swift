// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ArticleQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Article($articleid: String!) {
      article(articleid: $articleid) {
        __typename
        errors {
          __typename
          code
          message
          description
        }
        info {
          __typename
          id
          title
          imagePath
          nice
          context
          userStatus {
            __typename
            nice
            list
          }
          comment {
            __typename
            name
            image
            comment
          }
        }
      }
    }
    """

  public let operationName: String = "Article"

  public var articleid: String

  public init(articleid: String) {
    self.articleid = articleid
  }

  public var variables: GraphQLMap? {
    return ["articleid": articleid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("article", arguments: ["articleid": GraphQLVariable("articleid")], type: .nonNull(.object(Article.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(article: Article) {
      self.init(unsafeResultMap: ["__typename": "Query", "article": article.resultMap])
    }

    public var article: Article {
      get {
        return Article(unsafeResultMap: resultMap["article"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "article")
      }
    }

    public struct Article: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Article"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("errors", type: .list(.object(Error.selections))),
          GraphQLField("info", type: .object(Info.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(errors: [Error?]? = nil, info: Info? = nil) {
        self.init(unsafeResultMap: ["__typename": "Article", "errors": errors.flatMap { (value: [Error?]) -> [ResultMap?] in value.map { (value: Error?) -> ResultMap? in value.flatMap { (value: Error) -> ResultMap in value.resultMap } } }, "info": info.flatMap { (value: Info) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var errors: [Error?]? {
        get {
          return (resultMap["errors"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Error?] in value.map { (value: ResultMap?) -> Error? in value.flatMap { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error?]) -> [ResultMap?] in value.map { (value: Error?) -> ResultMap? in value.flatMap { (value: Error) -> ResultMap in value.resultMap } } }, forKey: "errors")
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

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ERRORS"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("code", type: .nonNull(.scalar(Int.self))),
            GraphQLField("message", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(code: Int, message: String, description: String) {
          self.init(unsafeResultMap: ["__typename": "ERRORS", "code": code, "message": message, "description": description])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var code: Int {
          get {
            return resultMap["code"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "code")
          }
        }

        public var message: String {
          get {
            return resultMap["message"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }

        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }
      }

      public struct Info: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ArticleInfo"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("imagePath", type: .nonNull(.scalar(String.self))),
            GraphQLField("nice", type: .nonNull(.scalar(Int.self))),
            GraphQLField("context", type: .nonNull(.scalar(String.self))),
            GraphQLField("userStatus", type: .object(UserStatus.selections)),
            GraphQLField("comment", type: .list(.object(Comment.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, title: String, imagePath: String, nice: Int, context: String, userStatus: UserStatus? = nil, comment: [Comment?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "ArticleInfo", "id": id, "title": title, "imagePath": imagePath, "nice": nice, "context": context, "userStatus": userStatus.flatMap { (value: UserStatus) -> ResultMap in value.resultMap }, "comment": comment.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var imagePath: String {
          get {
            return resultMap["imagePath"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "imagePath")
          }
        }

        public var nice: Int {
          get {
            return resultMap["nice"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "nice")
          }
        }

        public var context: String {
          get {
            return resultMap["context"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "context")
          }
        }

        public var userStatus: UserStatus? {
          get {
            return (resultMap["userStatus"] as? ResultMap).flatMap { UserStatus(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "userStatus")
          }
        }

        public var comment: [Comment?]? {
          get {
            return (resultMap["comment"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Comment?] in value.map { (value: ResultMap?) -> Comment? in value.flatMap { (value: ResultMap) -> Comment in Comment(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }, forKey: "comment")
          }
        }

        public struct UserStatus: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ArticleUserInfo"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("nice", type: .nonNull(.scalar(Bool.self))),
              GraphQLField("list", type: .nonNull(.scalar(Bool.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(nice: Bool, list: Bool) {
            self.init(unsafeResultMap: ["__typename": "ArticleUserInfo", "nice": nice, "list": list])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nice: Bool {
            get {
              return resultMap["nice"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "nice")
            }
          }

          public var list: Bool {
            get {
              return resultMap["list"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "list")
            }
          }
        }

        public struct Comment: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Comment"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("image", type: .nonNull(.scalar(String.self))),
              GraphQLField("comment", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, image: String, comment: String) {
            self.init(unsafeResultMap: ["__typename": "Comment", "name": name, "image": image, "comment": comment])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var image: String {
            get {
              return resultMap["image"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "image")
            }
          }

          public var comment: String {
            get {
              return resultMap["comment"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "comment")
            }
          }
        }
      }
    }
  }
}

public final class ArticlesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Articles($genre: String!, $year: Int, $month: Int) {
      articles(genre: $genre, year: $year, month: $month) {
        __typename
        articles {
          __typename
          id
          title
          ImagePath
          tags
        }
        errors {
          __typename
          code
          message
          description
        }
      }
    }
    """

  public let operationName: String = "Articles"

  public var genre: String
  public var year: Int?
  public var month: Int?

  public init(genre: String, year: Int? = nil, month: Int? = nil) {
    self.genre = genre
    self.year = year
    self.month = month
  }

  public var variables: GraphQLMap? {
    return ["genre": genre, "year": year, "month": month]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("articles", arguments: ["genre": GraphQLVariable("genre"), "year": GraphQLVariable("year"), "month": GraphQLVariable("month")], type: .nonNull(.object(Article.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(articles: Article) {
      self.init(unsafeResultMap: ["__typename": "Query", "articles": articles.resultMap])
    }

    public var articles: Article {
      get {
        return Article(unsafeResultMap: resultMap["articles"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "articles")
      }
    }

    public struct Article: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Articles"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("articles", type: .list(.object(Article.selections))),
          GraphQLField("errors", type: .list(.object(Error.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(articles: [Article?]? = nil, errors: [Error?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Articles", "articles": articles.flatMap { (value: [Article?]) -> [ResultMap?] in value.map { (value: Article?) -> ResultMap? in value.flatMap { (value: Article) -> ResultMap in value.resultMap } } }, "errors": errors.flatMap { (value: [Error?]) -> [ResultMap?] in value.map { (value: Error?) -> ResultMap? in value.flatMap { (value: Error) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var articles: [Article?]? {
        get {
          return (resultMap["articles"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Article?] in value.map { (value: ResultMap?) -> Article? in value.flatMap { (value: ResultMap) -> Article in Article(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Article?]) -> [ResultMap?] in value.map { (value: Article?) -> ResultMap? in value.flatMap { (value: Article) -> ResultMap in value.resultMap } } }, forKey: "articles")
        }
      }

      public var errors: [Error?]? {
        get {
          return (resultMap["errors"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Error?] in value.map { (value: ResultMap?) -> Error? in value.flatMap { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error?]) -> [ResultMap?] in value.map { (value: Error?) -> ResultMap? in value.flatMap { (value: Error) -> ResultMap in value.resultMap } } }, forKey: "errors")
        }
      }

      public struct Article: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ArticleHeader"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("ImagePath", type: .nonNull(.scalar(String.self))),
            GraphQLField("tags", type: .list(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, title: String, imagePath: String, tags: [String?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "ArticleHeader", "id": id, "title": title, "ImagePath": imagePath, "tags": tags])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var imagePath: String {
          get {
            return resultMap["ImagePath"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "ImagePath")
          }
        }

        public var tags: [String?]? {
          get {
            return resultMap["tags"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "tags")
          }
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ERRORS"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("code", type: .nonNull(.scalar(Int.self))),
            GraphQLField("message", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(code: Int, message: String, description: String) {
          self.init(unsafeResultMap: ["__typename": "ERRORS", "code": code, "message": message, "description": description])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var code: Int {
          get {
            return resultMap["code"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "code")
          }
        }

        public var message: String {
          get {
            return resultMap["message"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }

        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }
      }
    }
  }
}

public final class SignupMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Signup {
      signup {
        __typename
        value
        errors {
          __typename
          code
          message
          description
        }
      }
    }
    """

  public let operationName: String = "Signup"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("signup", type: .nonNull(.object(Signup.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(signup: Signup) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "signup": signup.resultMap])
    }

    public var signup: Signup {
      get {
        return Signup(unsafeResultMap: resultMap["signup"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "signup")
      }
    }

    public struct Signup: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Token"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("value", type: .nonNull(.scalar(String.self))),
          GraphQLField("errors", type: .list(.object(Error.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(value: String, errors: [Error?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Token", "value": value, "errors": errors.flatMap { (value: [Error?]) -> [ResultMap?] in value.map { (value: Error?) -> ResultMap? in value.flatMap { (value: Error) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var value: String {
        get {
          return resultMap["value"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "value")
        }
      }

      public var errors: [Error?]? {
        get {
          return (resultMap["errors"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Error?] in value.map { (value: ResultMap?) -> Error? in value.flatMap { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error?]) -> [ResultMap?] in value.map { (value: Error?) -> ResultMap? in value.flatMap { (value: Error) -> ResultMap in value.resultMap } } }, forKey: "errors")
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ERRORS"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("code", type: .nonNull(.scalar(Int.self))),
            GraphQLField("message", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(code: Int, message: String, description: String) {
          self.init(unsafeResultMap: ["__typename": "ERRORS", "code": code, "message": message, "description": description])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var code: Int {
          get {
            return resultMap["code"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "code")
          }
        }

        public var message: String {
          get {
            return resultMap["message"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }

        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }
      }
    }
  }
}
