import Foundation
import SwiftUI

class MapViewModel: ObservableObject{
  @Published var mapViewData: MapData
  init(){
    self.mapViewData = MapData()
  }
}
