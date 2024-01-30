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

#Preview {
  ContentView()
}
