//
//  DeepLinkManager.swift
//  NBC
//
//  Created by Lindsay Pond on 10/6/18.
//  Copyright © 2018 Findo Inc. All rights reserved.
//

import Foundation


class DeepLinkManager {
    fileprivate init() {}
    private var deeplinkType: DeeplinkType?
    
    func checkDeepLink() {
        guard let deeplinkType = deeplinkType else {
            return
        }
        
    DeeplinkNavigator.shared.proceedToDeeplink(deeplinkType)
        
        self.deeplinkType = nil
    }
}

class DeeplinkNavigator {
    static let shared = DeeplinkNavigator()
    private init() { }
    
    func proceedToDeeplink(_ type: DeeplinkType) {
        switch type {
        case .activateWithScan: break
            //
        case .activateWithCode: break
            //
        }
    }
}

class DeeplinkParser {
    static let shared = DeeplinkParser()
    private init() { }
    
    func parseDeepLink(_ url: URL) -> DeeplinkType? {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true), let host = components.host else {
            return nil
        }
        var pathComponents = components.path.components(separatedBy: "?code=")
        // the first component is empty
        pathComponents.removeFirst()
        //
        if let code = pathComponents.first {
            return .activateWith(code: code)
        } else {
            return .activateWithScan
        }
        return nil
    }
}
