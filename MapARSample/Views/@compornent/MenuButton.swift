import SwiftUI

struct MenuButtonView: View{
  @State private var isMenuOpen = false

  var body: some View{
    VStack{
      Spacer()
      Text("Hello")
        .font(.title)
        
      Spacer()

      if isMenuOpen{
        NavigationView{
          List{
            NavigationLink(
              destination: MapView(),
              label: {
                Text("Map")
              }
            )
            NavigationLink(
              destination: SecondView(viewModel: SecondViewModel()),
              label: {
                Text("secound")
              }
            )
          }

        }
      }
      Button(action: {
        withAnimation{
          self.isMenuOpen.toggle()
        }
      }){
        Image(systemName: "plus.circle.fill")
          .resizable()
          .frame(width: 50, height: 50)
          .foregroundColor(.blue)
      }
    }
    .navigationTitle("Menu")
  }
}

struct MenuButtonView_Previews: PreviewProvider{
  static var previews: some View{
    MenuButtonView()
  }
}
