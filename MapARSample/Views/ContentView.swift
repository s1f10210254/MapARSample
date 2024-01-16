import SwiftUI
import MapKit


struct ContentView: View {
  @StateObject private var viewModel = ContentViewModel()

  var body: some View {
    NavigationView {
      MapView()
      .toolbar{
        ToolbarButtons()
      }
    }
    .environmentObject(viewModel)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
