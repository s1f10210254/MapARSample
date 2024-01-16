import SwiftUI

struct ToolbarButtons: View {
  var body: some View {
    HStack{
      NavigationLink(
        destination: MapView(),
        label: {
          Text("Map")
        }
      )
      NavigationLink(
        destination: SecondView(viewModel: SecondViewModel()),
        label: {
          Text("secound")
        }
      )
      NavigationLink(
        destination: ARContentView(viewModel: ARViewModel()),
        label: {
          Text("AR")
        }
      )

    }
  }
}
