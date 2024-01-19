import SwiftUI

struct SecondView: View {
  @ObservedObject var viewModel: SecondViewModel
  @State var menuOpen: Bool = false
  var body: some View {
    // SecondView の UI と、viewModel を利用した処理を追加する
    Text("Second View").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)

  }
}

struct SecondView_Previews: PreviewProvider {
  static var previews: some View {
    SecondView(viewModel: SecondViewModel())
  }
}

