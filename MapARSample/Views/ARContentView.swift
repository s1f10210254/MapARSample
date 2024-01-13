import SwiftUI

struct ARContentView: View {
  @ObservedObject var viewModel: ARViewModel

  @State private var submittedExportRequest = false
  var body: some View {
    VStack{
      ARWirapper()
      Button(action:{
        submittedExportRequest.toggle()
      }){
        Text("Export")
      }
    }
  }
}

struct ARView_Previws: PreviewProvider{
  static var previews: some View {
    ARContentView(viewModel: ARViewModel())
  }
}
