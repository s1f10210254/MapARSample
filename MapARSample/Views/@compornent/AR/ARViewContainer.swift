import SwiftUI
import ARKit

struct ARViewContainer: UIViewRepresentable {
  var arSceneView = ARSCNView()
  func makeUIView(context: Context) -> some ARSCNView {
    arSceneView.session = ARSession()
    arSceneView.automaticallyUpdatesLighting = true
    return arSceneView
  }
  func updateUIView(_ uiView: UIViewType, context: Context) {
    
  }
}
