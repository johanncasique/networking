//
//  Parser.swift
//  
//
//  Created by johann casique on 27/4/21.
//

import Foundation
public typealias ResultCallback<T> = (Result<T, NetworkError>) -> Void

public protocol ParserProtocol {
    func json<T: Decodable>(data: Data, completion: @escaping ResultCallback<T>)
}

public struct Parser: ParserProtocol {
    
    let jsonDecoder = JSONDecoder()
    
    public func json<T>(data: Data, completion: @escaping ResultCallback<T>) where T: Decodable {
        do {
            let result: T = try jsonDecoder.decode(T.self, from: data)
            OperationQueue.main.addOperation { completion(.success(result)) }
        } catch let error {
            OperationQueue.main.addOperation { completion(.failure(.parseError(error: error))) }
        }
    }
}
