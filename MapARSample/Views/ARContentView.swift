import SwiftUI
import ARKit
struct ARContentView: View {
  @ObservedObject var viewModel: ARViewModel
  var body: some View {
    ARViewContainer()
      .onAppear{
        viewModel.startARSession()
      }
      .onDisappear{
        viewModel.stopARSession()
      }
  }
}

struct ARView_Previws: PreviewProvider{
  static var previews: some View{
    ARContentView(viewModel: ARViewModel())
  }
}
