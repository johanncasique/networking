
[![Build Status](https://travis-ci.com/johanncasique/networking.svg?branch=main)](https://travis-ci.com/johanncasique/networking)

# Networking Library

Tiny and simple framework to use in a project, with the most basic network request.

TODO:

- [ ] Improve documentation
- [ ] add unit test
- [ ] add class diagram
- [ ] add more use cases

Example how to use:

1. Create an Endpoint’s extension to ser the scheme (https or http) and  the host

```swift
extension Endpoint {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "jsonplaceholder.typicode.com"
    }
}
```

2. Create your endpoint with cases

```swift
enum UserEndpoint {
    case all
    case get(userId: Int)
}
```

Implement  `Endpoint` protocol

```swift
extension UserEndpoint: Endpoint {
    
    var request: URLRequest? {
        switch self {
        case .all:
            return request(forEndpoint: "/users")
        case .get(let userID):
            return request(forEndpoint: "/users/\(userID)")
        }
    }
    
    var httpMethod: String {
        switch self {
        case .all, .get:
            return "GET"
        }
    }
    
    var httpHeaders: [String : String]? {
        return nil
    }
    
    var queryItems: [URLQueryItem]? {
        return nil
    }
    
}
```

3. Create `DTO`

```swift
//User DTO
struct User: Codable {
    let id: Int
    let name, username, email: String
}
```

4. Finally the request from `WebService`

```swift
let webService = WebService()


webService.request(UserEndpoint.all) { (result: Result<[User], NetworkError>) in
    switch result {
    case .failure(let error):
        print(error)
    case .success(let users):
        print(users)
    }
}

webService.request(UserEndpoint.get(userId: 10)) { (result: Result<User, NetworkError>) in
    switch result {
    case .failure(let error):
        print(error)
    case .success(let users):
        print(users)
    }
}
```


