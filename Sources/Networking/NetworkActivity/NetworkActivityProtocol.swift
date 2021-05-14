//
//  NetworkActivityProtocol.swift
//  
//
//  Created by johann casique on 1/5/21.
//

import Foundation

public protocol NetworkActivityProtocol {
    func increment()
    func decrement()
    func observe(using closure: @escaping (NetworkActivityState) -> Void)
}
