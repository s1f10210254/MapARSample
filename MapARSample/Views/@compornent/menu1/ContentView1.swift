import SwiftUI
struct ContentView1: View {
    @State var isOpenSideMenu: Bool = false
    @State var text = "Hello, World!"
    var body: some View {
        ZStack{
            NavigationView {
                Text(text)
//                    .navigationBarTitle("メイン画面")
                    .navigationBarItems(leading: (
                        Button(action: {
                            self.isOpenSideMenu.toggle()
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .imageScale(.large)
                    }))
            }

            SideMenuView1(isOpen: $isOpenSideMenu, text: $text)
                .edgesIgnoringSafeArea(.all)
        }
    }
}
