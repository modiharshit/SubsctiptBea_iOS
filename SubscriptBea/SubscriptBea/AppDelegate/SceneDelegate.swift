//
//  SceneDelegate.swift
//  SubscriptBea
//
//  Created by Harshit on 26/11/21.
//  Copyright © 2021 Harshit Modi. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
                        
            self.setRootViewController()
        }
    }

    func setRootViewController() {
        if UserManager.sharedManager().isUserLoggedIn() {
            // Move to HomeVC
            let nav: NavigationController = UIStoryboard.main().instantiateViewController(withIdentifier: "NavigationController") as! NavigationController
            let obj = HomeVC.instantiate()
            nav.setViewControllers([obj], animated: false)
            nav.isNavigationBarHidden = true
            self.window?.rootViewController = nav
            self.window?.makeKeyAndVisible()
        } else {
            
            let nav: NavigationController = UIStoryboard.main().instantiateViewController(withIdentifier: "NavigationController") as! NavigationController
            let obj = LoginVC.instantiate()
            nav.setViewControllers([obj], animated: false)
            nav.isNavigationBarHidden = true
            self.window?.rootViewController = nav
            self.window?.makeKeyAndVisible()
            
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let urlPath : String = url.absoluteString
        print(urlPath)

        if self.isContainString(urlPath, subString: "1") {
            //here go to firstViewController view controller
            openImage(name: "1")
        }
        else if self.isContainString(urlPath, subString: "2") {
            //here go to secondViewController view controller
            openImage(name: "2")
        }
        else {
            //here go to thirdViewController view controller
            openImage(name: "3")
        }

        return true
    }
    
    func isContainString(_ string: String, subString: String) -> Bool {
        if (string as NSString).range(of: subString).location != NSNotFound { return true }
        else { return false }
    }
    
    func openImage(name:String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        vc.imgName = name
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

