import SwiftUI

struct SecondView: View {
    @ObservedObject var viewModel: SecondViewModel

    var body: some View {
        // SecondView の UI と、viewModel を利用した処理を追加する
      Text("Second View").padding()
      List {
        Text("1").onTapGesture{
          print("1")
        }
        Text("2").onTapGesture{
          print("2")
        }
        Text("3").onTapGesture{
          print("3")
        }
      }

    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(viewModel: SecondViewModel())
    }
}

