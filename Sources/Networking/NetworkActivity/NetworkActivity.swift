//
//  NetworkActivity.swift
//  
//
//  Created by johann casique on 1/5/21.
//

import Foundation

public class NetworkActivity: NetworkActivityProtocol {
    
    private var observation = [(NetworkActivityState) -> Void]()
    
    private var activityCount: Int = 0 {
        didSet {
            if activityCount < 0 {
                activityCount = 0
            }
            
            if oldValue > 0 && activityCount > 0 {
                return
            }
            stateDidChange()
        }
    }
    
    public init() {}
    
    private func stateDidChange() {
        let state = activityCount > 0 ? NetworkActivityState.show : NetworkActivityState.hide
        observation.forEach { closure in
            OperationQueue.main.addOperation { closure(state) }
        }
    }
    
    public func increment() {
        activityCount += 1
    }
    
    public func decrement() {
        activityCount -= 1
    }
    
    public func observe(using closure: @escaping (NetworkActivityState) -> Void) {
        observation.append(closure)
    }
}
