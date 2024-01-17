import SwiftUI

struct SecondView: View {
    @ObservedObject var viewModel: SecondViewModel

    var body: some View {
        // SecondView の UI と、viewModel を利用した処理を追加する
      Text("Second View").padding()

    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(viewModel: SecondViewModel())
    }
}

