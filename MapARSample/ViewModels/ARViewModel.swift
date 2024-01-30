//import Foundation
//import SwiftUI
//import ARKit
//
//class ARViewModel: ObservableObject{
//  @Published var isARSessionRunning = false
//
//  private var arSession: ARSession?
//  private var arScene: ARScene?
//  private var arConfigration: ARConfiguration{
//    let configration = ARWorldTrackingConfiguration()
//    return configration
//  }
//
//  init(){
//    setupARSession()
//  }
//
//  func startARSession(){
//    guard let arSession = arSession else {return}
//    arSession.run(arConfigration)
//    isARSessionRunning = true
//  }
//
//  func stopARSession(){
//    guard let arSession = arSession else {return}
//    arSession.pause()
//    isARSessionRunning = false
//  }
//
//  private func setupARSession(){
//    arScene = ARScene()
//    arSession = ARSession()
//    arSession?.delegate = arScene
//  }
//}
