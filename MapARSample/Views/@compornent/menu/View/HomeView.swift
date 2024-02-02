import SwiftUI
import MapKit

struct HomeView: View {
  @Binding var presentSideMenu: Bool

  var body: some View {
    ZStack(){
      Map()
      TabItemView(presentSideMenu: $presentSideMenu, title: "HomeView")
        .padding(.horizontal, 24)
    }



  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView(presentSideMenu: .constant(false))
  }
}
