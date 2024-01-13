import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var mapData: MapData

    init() {
        // 初期化時に必要なプロパティやデータを初期化する
        self.mapData = MapData()
    }

    // ContentViewModelに必要なメソッドを追加
    func updateMapData(newMapData: MapData) {
        self.mapData = newMapData
    }
}

