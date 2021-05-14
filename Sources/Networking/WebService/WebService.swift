//
//  File.swift
//  
//
//  Created by johann casique on 14/5/21.
//

import Foundation

public class WebService: WebServiceProtocol {
    
    private let urlSession: URLSession
    private let parser: Parser
    private let networkActivity: NetworkActivityProtocol
    
    public init(urlSession: URLSession = URLSession(configuration: .default),
         parser: Parser = Parser(),
         networkActivity: NetworkActivityProtocol = NetworkActivity()) {
        self.urlSession = urlSession
        self.parser = parser
        self.networkActivity = networkActivity
    }
    
    public func request<T>(_ endpoint: Endpoint, completion: @escaping ResultCallback<T>) where T : Decodable {
        guard let request = endpoint.request else {
            OperationQueue.main.addOperation { completion(.failure(.invalidRequest)) }
            return
        }
        
        networkActivity.increment()
        
        let task = urlSession.dataTask(with: request) { [unowned self] data, response, error in
            self.networkActivity.decrement()
            
            if let error = error {
                OperationQueue.main.addOperation { completion(.failure(.responseError(error: error))) }
                return
            }
            
            guard let data = data else {
                OperationQueue.main.addOperation { completion(.failure(.dataMissing)) }
                return
            }
            
            self.parser.json(data: data, completion: completion)
        }
        
        task.resume()
    }
}
