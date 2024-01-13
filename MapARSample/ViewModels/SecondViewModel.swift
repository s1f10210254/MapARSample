import Foundation
import SwiftUI

class SecondViewModel: ObservableObject {
    @Published var secondViewData:SecoundViewData

    init() {
        // 初期化時に必要なプロパティやデータを初期化する
        self.secondViewData = SecoundViewData()
    }

    // SecondViewModelに必要なメソッドを追加
    func performAction() {
        // 何らかのアクションを実行する
    }
}

