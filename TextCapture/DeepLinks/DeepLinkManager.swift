//
//  DeepLinkManager.swift
//  NBC
//
//  Created by Lindsay Pond on 10/6/18.
//  Copyright © 2018 Findo Inc. All rights reserved.
//

import Foundation

class DeepLinkManager {
    init() {}
    private var deeplinkType: DeepLinkType?
    
    func checkDeepLink() {
        guard let deeplinkType = deeplinkType else {
            return
        }
        
        DeeplinkNavigator.shared.proceedToDeeplink(deeplinkType)
        
        self.deeplinkType = nil
    }
    
    @discardableResult
    func handleDeeplink(url: URL) -> Bool {
        deeplinkType = DeeplinkParser.shared.parseDeepLink(url)
        return deeplinkType != nil
    }
}

class DeeplinkNavigator {
    static let shared = DeeplinkNavigator()
    private init() { }
    
    func proceedToDeeplink(_ type: DeepLinkType) {
        switch type {
        case .activateWithScan:
            print("Here")
            
            break
        //
        case .activateWith(code: let code):
            if let vc = UIApplication.shared.keyWindow?.rootViewController?.presentedViewController {
                if let codeConfirmationController = CodeConfirmationViewController.viewController() {
                    codeConfirmationController.code = code
                    vc.present(codeConfirmationController, animated: false, completion: nil)
                }
            } else if let vc = UIApplication.shared.keyWindow?.rootViewController {
                if let codeConfirmationController = CodeConfirmationViewController.viewController() {
                    codeConfirmationController.code = code
                    vc.present(codeConfirmationController, animated: false, completion: nil)
                }
                
            }
        }
    }
}

class DeeplinkParser {
    static let shared = DeeplinkParser()
    private init() { }
    
    func parseDeepLink(_ url: URL) -> DeepLinkType? {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true), let host = components.host else {
            return nil
        }
        
        if host == "activate" {
            if let code = components.queryItems?[0].value {
                return DeepLinkType.activateWith(code: code)
            } else {
                return DeepLinkType.activateWithScan
            }
        }
        return nil
    }
}
