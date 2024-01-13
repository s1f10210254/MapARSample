import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
  static let tus_station = CLLocationCoordinate2D(latitude: 34.734036, longitude: 136.5101973)
}
struct ContentView: View {
  @StateObject private var viewModel = ContentViewModel()

  var body: some View {
    NavigationView {
      Map{
        Marker("Tsu-Station", systemImage:"train.side.front.car", coordinate: .tus_station).tint(.blue)
      }
//      .mapStyle(.imagery(elevation: .realistic))
        .toolbar{
          NavigationLink(
            destination: SecondView(viewModel: SecondViewModel()),
            label: {
              Text("secound")
            }
          )
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
