//
//  Endpoint.swift
//  
//
//  Created by johann casique on 27/4/21.
//

import Foundation

public protocol Endpoint {
    var request: URLRequest? { get }
    var httpMethod: String { get }
    var httpHeaders: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
    var scheme: String { get }
    var host: String { get }
}

public extension Endpoint {
    public func request(forEndpoint endpoint: String) -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = endpoint
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        
        if let httpHeader = httpHeaders {
            for (key, value) in httpHeader {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return request
    }
}
