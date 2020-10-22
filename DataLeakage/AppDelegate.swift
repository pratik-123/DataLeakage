//
//  AppDelegate.swift
//  DataLeakage
//
//  Created by Pratik on 22/10/20.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var dummyScreen: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let packagePath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first
        print(packagePath ?? "")
        
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("applicationDidEnterBackground")
        showDummyWindow()
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("applicationWillEnterForeground")
        hideDummyWindow()
    }
}
//MARK: Data leakage from application screenshot prevent
extension AppDelegate {
    ///Open dummy screen on main window
    fileprivate func showDummyWindow() {
        dummyScreen = window
        dummyScreen = UIWindow(frame: UIScreen.main.bounds)
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeController = mainStoryboard.instantiateViewController(withIdentifier: "HideMyViewController") as! HideMyViewController
        dummyScreen?.rootViewController = homeController
        dummyScreen?.windowLevel = .alert
        dummyScreen?.makeKeyAndVisible()
    }
    
    /// Hide dummy screen
    fileprivate func hideDummyWindow() {
        dummyScreen?.isHidden = true
        dummyScreen = nil
    }
}
