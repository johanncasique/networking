//
//  NetworkError.swift
//  
//
//  Created by johann casique on 27/4/21.
//

import Foundation

public enum NetworkError: Error {
    case invalidRequest
    case dataMissing
    case endpointNotMocked
    case mockDataMissing
    case responseError(error: Error)
    case parseError(error: Error)
}
