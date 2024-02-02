import SwiftUI
import Firebase

struct SignUpView1: View {
  @EnvironmentObject var viewModel: AppViewModel // AppViewModelを利用
  @State private var email: String = ""
  @State private var password: String = ""
  @State private var errorMessage: String?

  var body: some View {
    VStack(spacing:20) {
      Text("アカウント作成").font(.title)
      TextField("メールアドレス", text: $email)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .autocapitalization(.none) // メールアドレスの自動大文字化をオフにする
        .padding()
      
      SecureField("パスワード", text: $password)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
      
      if let errorMessage = errorMessage{
        Text(errorMessage)
          .foregroundColor(.red)
      }

      Button("アカウント作成") {
        createAccount()
      }
      .padding()
      .background(Color.blue)
      .foregroundColor(.white)
      .cornerRadius(10)
    }
    .padding()
  }
  
  private func createAccount() {
    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
      if let error = error {
        self.errorMessage = error.localizedDescription
      } else {
        // アカウント作成に成功した場合の処理
        self.viewModel.currentUserState  = .loggedInButProfileNotCompleted
      }
    }
  }
}

struct SignUpView_Previews: PreviewProvider {
  static var previews: some View {
    SignUpView1()
  }
}

