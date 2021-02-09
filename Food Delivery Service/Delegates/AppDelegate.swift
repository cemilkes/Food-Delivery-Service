//
//  AppDelegate.swift
//  Food Delivery Service
//
//  Created by Cemil Keş on 8/15/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import Stripe

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        if (MUser.currentUser() != nil && MUser.currentUser()?.onBoard == true){
            NextViewController(storybordid: ViewController.tabbarController, storyboardName: Storyboard.main)
            print("open main")
        }else{
           // NextViewController(storybordid: ViewController.alertController, storyboardName: Storyboard.alert)
            NextViewController(storybordid: ViewController.welcomeController, storyboardName: Storyboard.authentication)
            print("open auth")
        }

        initializeStripePayment()
        
        
        return true
    }
    
    func NextViewController(storybordid:String, storyboardName: String)
    {
        
        let storyBoard:UIStoryboard = UIStoryboard(name: storyboardName, bundle: nil)
        let exampleVC = storyBoard.instantiateViewController(withIdentifier:storybordid )
        // self.present(exampleVC, animated: true)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = exampleVC
        window?.makeKeyAndVisible()
    }
    
    func initializeStripePayment(){
        STPPaymentConfiguration.shared.publishableKey = Constats.publishableKey
        StripeClient.shared.baseURLString = Constats.baseURLString
    }
    
    
    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

