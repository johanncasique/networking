//
//  File.swift
//  
//
//  Created by johann casique on 18/5/21.
//

import Foundation

protocol MockEndpoint: Endpoint {
    var mockFilename: String? { get }
    var mockExtension: String? { get }
}
