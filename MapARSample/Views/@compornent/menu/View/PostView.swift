import SwiftUI

struct PostView: View {
    @Binding var presentSideMenu: Bool

    var body: some View {
        TabItemView(presentSideMenu: $presentSideMenu, title: "PostView")
            .padding(.horizontal, 24)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(presentSideMenu: .constant(false))
    }
}
