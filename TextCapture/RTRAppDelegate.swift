// ABBYY® Real-Time Recognition SDK 1 © 2016 ABBYY Production LLC.
// ABBYY is either a registered trademark or a trademark of ABBYY Software Ltd.

import UIKit

@UIApplicationMain
class RTRAppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var deepLinkManager = DeepLinkManager()
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        deepLinkManager.checkDeepLink()
        
    }
    
    // MARK: Deeplinks
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return deepLinkManager.handleDeeplink(url: url)
    }
    // MARK: Universal Links
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb {
            if let url = userActivity.webpageURL {
                return deepLinkManager.handleDeeplink(url: url)
            }
        }
        return false
    }
}
