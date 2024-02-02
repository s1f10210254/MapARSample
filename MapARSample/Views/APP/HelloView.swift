import SwiftUI

struct HelloView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello")
                    .font(.largeTitle)
                    .padding()

                Spacer()

                // アプリのイメージに合ったイラストや画像を挿入
                Image("welcome-image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300)

                Spacer()

                NavigationLink(destination: SignInView1()) {
                    Text("ログイン")
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()

                NavigationLink(destination: SignUpView1()) {
                    Text("新規登録")
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding()
            }
            .padding()
        }
    }
}





struct HelloPage_Previews: PreviewProvider {
    static var previews: some View {
        HelloView()
    }
}

