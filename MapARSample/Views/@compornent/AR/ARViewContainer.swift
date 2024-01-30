import RealityKit
import ARKit
import SwiftUI

struct ARViewContainer: UIViewRepresentable {

    func makeUIView(context: Context) -> ARView {

        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
        arView.addTapGesture()

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
}
