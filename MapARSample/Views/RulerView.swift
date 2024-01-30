import SwiftUI
import RealityKit

struct RulerView: View {
  var body: some View {
    RulerViewContainer().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
  }
}

struct RulerViewContainer: UIViewRepresentable{
  //Viewが生成された時
  func makeUIView(context: Context) -> ARView {
    let arView = ARView(frame: .zero)

    let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap))
    arView.addGestureRecognizer(tapGesture)

    context.coordinator.arVIew = arView
    context.coordinator.setupUi()

    return arView
  }
  func updateUIView(_ uiView: ARView, context: Context) {
  }

  func makeCoordinator() -> Coordinator {
    Coordinator()
  }
}


