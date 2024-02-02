import SwiftUI

struct MenuView2: View {

  var body: some View {
    VStack(alignment: .leading) {
      Image("animal_kuma")
        .resizable()
        .overlay(
          Circle().stroke(Color.gray, lineWidth: 1))
        .frame(width: 60, height: 60)
        .clipShape(Circle())
      Text("NickName")
        .font(.largeTitle)
      Text("@userId")
        .font(.caption)
      Divider()
      ScrollView (.vertical, showsIndicators: true) {
        HStack {
          Image(systemName: "person")
          Text("Profile")
        }.padding()
        HStack {
          Image(systemName: "text.bubble")
          Text("Setting")
        }.padding()
        HStack {
          Image(systemName: "gearshape")
          Text("Setting")
        }.padding()
      }
      Divider()
      Text("Settings and privacy")
    }
    .padding(.horizontal, 20)
  }
}


struct MenuView_Previews: PreviewProvider {
  static var previews: some View {
    MenuView2()
  }
}
