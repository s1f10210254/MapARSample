import SwiftUI

struct ContentView2: View {
    // offset変数でメニューを表示・非表示するためのオフセットを保持します
    @State private var offset = CGFloat.zero
    @State private var closeOffset = CGFloat.zero
    @State private var openOffset = CGFloat.zero

    var body: some View {
        // 画面サイズの取得にGeometoryReaderを利用します
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // メインコンテンツ
                NavigationView {
                    ZStack {
                        VStack () {
                            Spacer()
                            Text("This is main contents")
                                .font(.largeTitle)
                            Spacer()
                        }
                        // スライドメニューがでてきたらメインコンテンツをグレイアウトします
                        Color.gray.opacity(
                            Double((self.closeOffset - self.offset)/self.closeOffset) - 0.4
                        )
                    }
                    .navigationBarTitle("This is bar", displayMode: .inline)
                    .navigationBarItems(leading: Button(action: {
                            self.offset = self.openOffset
                        }){
                            Image(systemName: "list.bullet")
                        })
                    .edgesIgnoringSafeArea(.vertical)
                }
                // スライドメニュー
                MenuView2()
                    .background(Color.white)
                    .frame(width: geometry.size.width * 0.7)
                    .edgesIgnoringSafeArea(.bottom)
                    // 最初に画面のオフセットの値をスライドメニュー分マイナスします。
                    .onAppear(perform: {
                        self.offset = geometry.size.width * -1
                        self.closeOffset = self.offset
                        self.openOffset = .zero
                    })
                    .offset(x: self.offset)
                    // スライドのアニメーションを設定します
                    .animation(.default, value: self.offset)
            }
            // ジェスチャーに関する実装をします
            // スワイプのしきい値を設定してユーザの思わぬメニューの出現を防ぎます
            .gesture(DragGesture(minimumDistance: 5)
                    .onChanged{ value in
                        // オフセットの値(メニューの位置)をスワイプした距離に応じて狭めていきます
                        if (self.offset < self.openOffset) {
                            self.offset = self.closeOffset + value.translation.width
                        }
                    }
                    .onEnded { value in
                        // スワイプの終了位置が開始位置よりも右だったらメニューを開く
                        if (value.location.x > value.startLocation.x) {
                            self.offset = self.openOffset
                        } else {
                            self.offset = self.closeOffset
                        }
                    }
                )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
