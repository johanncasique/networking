//
//  File.swift
//  
//
//  Created by johann casique on 14/5/21.
//

import Foundation

//WebService
protocol WebServiceProtocol {
    func request<T: Decodable>(_ endpoint: Endpoint, completion: @escaping ResultCallback<T>)
}
