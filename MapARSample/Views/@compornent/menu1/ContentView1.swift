struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("Hello, World!")
            .navigationBarTitle("メイン画面")
            .navigationBarItems(leading: (
                Button(action: {
                    // Todo: サイドメニューを開く
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }))
        }
    }
}
