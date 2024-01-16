//
//  MapARSampleApp.swift
//  MapARSample
//
//  Created by Hiroki on 2024/01/13.
//

import SwiftUI
import ARKit
@main
struct MapARSampleApp: App {
  @UIApplicationDelegateAdaptor(Appdelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class Appdelegate: NSObject, UIApplicationDelegate{
  func application(_ application: UIApplication, didFinishLaunchingWithOptions lanchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    if !ARWorldTrackingConfiguration.supportsFrameSemantics(.sceneDepth){
      print("does not support AR")
    }
    return true
  }
}
