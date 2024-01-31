import SwiftUI

struct SettingView: View {
    @Binding var presentSideMenu: Bool

    var body: some View {
        TabItemView(presentSideMenu: $presentSideMenu, title: "SettingView")
            .padding(.horizontal, 24)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(presentSideMenu: .constant(false))
    }
}
