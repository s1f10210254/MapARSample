import SwiftUI

struct MainView2: View {

    init() {
        // タイトルバーのフォントサイズを変更
        UINavigationBar.appearance().titleTextAttributes = [.font: UIFont.systemFont(ofSize: 26)]
        // タイトルバーの背景色を変更
        UINavigationBar.appearance().barTintColor = UIColor.white
        // タイトルバーの裏の背景色を変更
        UINavigationBar.appearance().backgroundColor = UIColor.white
        // タブバーの背景色を変更
        UITabBar.appearance().barTintColor = UIColor.white
        // タブバーの裏の背景色を変更
        UITabBar.appearance().backgroundColor = UIColor.white
    }

    var body: some View {
        TabView {
            NavigationView {
                ScrollView (.vertical, showsIndicators: false) {
                    // この部分は次のセクションで実装します。
                    TimelineView2(timelines: timelines)
                }
                    // タイトルと左右のアイコンを指定
                    .navigationBarTitle(Text("🐥"), displayMode: .inline)
                    .navigationBarItems(
                        leading: Image("animal_kuma")
                            .resizable()
                            .overlay(
                                Circle().stroke(Color.gray, lineWidth: 1))
                            .frame(width: 30, height: 30)
                            .clipShape(Circle()),
                        trailing: HStack{
                            IconView(systemName: "sparkles")
                        }
                        .padding(.bottom, 10)
                    )
                }
                .tabItem {
                    IconView(systemName: "house")
                }
            IconView(systemName: "magnifyingglass")
                .tabItem {
                    IconView(systemName: "magnifyingglass")
                }
            IconView(systemName: "bell")
                .tabItem {
                    IconView(systemName: "bell")
                }
            IconView(systemName: "envelope")
                .tabItem {
                    IconView(systemName: "envelope")
                }
        }
        // 選択されているアイコンの色を青に変更
        .accentColor(.blue)
    }
}

// Iconの形式をそろえる
struct IconView: View {
    var systemName: String

    var body: some View {
        Image(systemName: systemName)
            .font(.title)
    }
}

struct MainView_Previews2: PreviewProvider {
    static var previews: some View {
        MainView2()
    }
}
