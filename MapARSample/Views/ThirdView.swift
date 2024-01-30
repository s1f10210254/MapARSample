import SwiftUI
import RealityKit

struct ThirdView: View {
//  @State var isCubeRed = false
  @State var isAnimated = false
  var body: some View {
    ARViewContainer(isAnimated: $isAnimated)
      .edgesIgnoringSafeArea(.all)
      .onTapGesture{
//        isCubeRed = true;
        isAnimated = true;
      }
  }
}

struct ARViewContainer: UIViewRepresentable{
//  @Binding var isCubeRed: Bool
  @Binding var isAnimated: Bool
  //Viewが生成された時
  func makeUIView(context: Context) -> ARView {
    let arView = ARView(frame: .zero)

    // Create a cube model
//    let mesh = MeshResource.generateBox(size: 0.1, cornerRadius: 0.005)
//    let material = SimpleMaterial(color: .gray, roughness: 0.15, isMetallic: true)
//    let model = ModelEntity(mesh: mesh, materials: [material])

//    let model = try! ModelEntity.load(named: "Magnet")
//    let model1 = try! ModelEntity.load(named: "Iphone")
    let model2 = try! ModelEntity.load(named: "nathan")

    let anchor = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: SIMD2<Float>(0.1,0.1)))
    anchor.children.append(model2)

    arView.scene.anchors.append(anchor)
    return arView
  }
  func updateUIView(_ uiView: ARView, context: Context) {
//    if isCubeRed{
//      let mesh = MeshResource.generateBox(size: 0.1, cornerRadius: 0.005)
//      let material = SimpleMaterial(color: .red, roughness: 0.15,isMetallic: true)
//      let newModel = ModelEntity(mesh: mesh, materials: [material])
//
//      uiView.scene.anchors[0].children[0] = newModel
//    }
    if isAnimated{
      let model = uiView.scene.anchors[0].children[0]
      let animation = model.availableAnimations.first
      model.playAnimation(animation!)
    }
  }
}



//#Preview {
//  ThirdView()
//}
