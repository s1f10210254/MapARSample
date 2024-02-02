import SwiftUI
import MapKit


struct ContentView: View {
  var body: some View {
    NavigationView {
      MapView()
      .toolbar{
        ToolbarButtons()
      }


    }
  }
}

//#Preview {
//  ContentView()
//}
