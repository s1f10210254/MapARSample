import SwiftUI

struct MainTabView: View {
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0

    var body: some View {
        ZStack {
            TabView(selection: $selectedSideMenuTab) {
                HomeView(presentSideMenu: $presentSideMenu)
                .tabItem { Label("Home", systemImage:"1.circle" )}
                    .tag(0)
                PostView(presentSideMenu: $presentSideMenu)
                .tabItem { Label("Post", systemImage:"2.circle" )}
                    .tag(1)
                NewsView(presentSideMenu: $presentSideMenu)
                .tabItem { Label("News", systemImage:"3.circle" )}
                    .tag(2)
                SettingView(presentSideMenu: $presentSideMenu)
                .tabItem { Label("System", systemImage:"4.circle" )}
                    .tag(3)
            }
          SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))

        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
