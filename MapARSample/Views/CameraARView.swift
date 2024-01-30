//
//import SwiftUI
//import RealityKit
//
//struct CameraARView: View {
//  var body: some View {
//    ZStack(alignment: .bottom){
//      CameraARViewContainer().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//      Button{
//        ARVariables.arView.snapshot(saveToHDR: false) { (image) in
//          UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
//        }
//      } label: {
//        Circle()
//          .frame(width: 60, height: 60)
//          .padding()
//      }
//    }
//
//  }
//}
//
//struct ARVariables{
//  static var arView: ARView = ARView()
//}
//
//struct CameraARViewContainer: UIViewRepresentable{
//  //Viewが生成された時
//  func makeUIView(context: Context) -> ARView {
//    ARVariables.arView =  ARView(frame: .zero)
//    let boxAnchor = try! Iphone.loadbox()
//
//    ARVariables.arView.scene.anchors.append(boxAnchor)
//    return ARVariables.arView
//  }
//  func updateUIView(_ uiView: ARView, context: Context) {
//  }
//}
//
//
//#if DEBUG
//struct ContentView_Previews: PreviewProvider {
//  static var previews: some View{
//    CameraARView()
//  }
//}
//#endif
