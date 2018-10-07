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
}
