import SwiftUI

struct ToolbarButtons: View {
  @StateObject var viewModel = AuthViewModel()

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
        destination: ThirdView(),
        label: {
          Text("AR")
        }
      )
      NavigationLink(
        destination: RulerView(),
        label: {
          Text("Ruler")
        }
      )

//      NavigationLink(
//        destination: HelloPage(viewModel: viewModel),
//        label: {
//          Text("Logout")
//        }
//      )

    }
  }
}

