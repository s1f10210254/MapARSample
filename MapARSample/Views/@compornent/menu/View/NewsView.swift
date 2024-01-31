import SwiftUI

struct NewsView: View {
    @Binding var presentSideMenu: Bool

    var body: some View {
        TabItemView(presentSideMenu: $presentSideMenu, title: "NewsView")
            .padding(.horizontal, 24)
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(presentSideMenu: .constant(false))
    }
}
