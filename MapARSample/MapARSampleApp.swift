//import SwiftUI
//import FirebaseCore
//
//
//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//
//    return true
//  }
//}
//
////@main
////struct MapARSampleApp: App {
////  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
////          @StateObject var viewModel = AuthViewModel()
////
////          var body: some Scene {
////              WindowGroup {
////                  // ログイン状態によって画面遷移するページを変更する
////                  if viewModel.isAuthenticated {
//////                      HelloPage(viewModel: viewModel)
////                    ContentView();
////                  } else {
////                      SignInView(viewModel: viewModel)
////                  }
////              }
////          }
////}
//
//@main
//struct SwiftUI_PlaygroundApp: App {
////    @State static var presentSideMenu = false
//    var body: some Scene {
//        WindowGroup {
//            MainTabView()
////          ContentView1()
//        }
//    }
//}

//
//import SwiftUI
//import Firebase
//
//@main
//struct MapARSampleApp: App{
//  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
//  var viewModel = AppViewModel()
//  var body: some Scene{
//    WindowGroup{
//      AppView().environmentObject(viewModel)
//    }
//  }
//}
//
//class AppDelegate: UIResponder, UIApplicationDelegate {
//  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//    FirebaseApp.configure()
//    return true
//  }
//}

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
