import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
  static let tus_station = CLLocationCoordinate2D(latitude: 34.734036, longitude: 136.5101973)
}
struct MapView: View{
  var body: some View{
//    Map{
//      Marker("Tsu-Station", systemImage:"train.side.front.car", coordinate: .tus_station).tint(.blue)
//    }
    Map()
  }
}
