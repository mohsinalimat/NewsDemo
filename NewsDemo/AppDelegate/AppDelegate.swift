//
//  AppDelegate.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/16/19.
//  Copyright © 2019 AliAdam. All rights reserved.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setAppearance()
        startNetworkMonitor()
        return true
    }
    
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        stopNetworkMonitor()
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        startNetworkMonitor()
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        startNetworkMonitor()
    }
    
    
}

extension AppDelegate{
    
    /// Set NavigationBar title appearance
    private func setAppearance() {
            UINavigationBar.appearance().barTintColor = Colors.brandColor
            UINavigationBar.appearance().tintColor = Colors.brandwhite

    }
    
    /// Starts monitoring the network availability status
    private func startNetworkMonitor() {
        ReachabilityManager.shared.startMonitoring()
    }
    
    /// Stop monitoring the network availability status
    private func stopNetworkMonitor() {
        ReachabilityManager.shared.stopMonitoring()
    }
    
}
