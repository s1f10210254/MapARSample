import SwiftUI

struct SignUpView: View {
  @State private var email: String = ""
  @State private var password: String = ""
  @State private var userId: String = ""
  @State private var NickName: String = ""
  @ObservedObject var viewModel: AuthViewModel

  var body: some View {
    VStack {
      TextField("Email", text: $email)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()

      SecureField("Password", text: $password)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()

      TextField("NickName", text: $NickName)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()

      TextField("userId", text: $userId)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()




      Button("Sign Up") {
        viewModel.signUp(email: email, password: password)
      }

      if viewModel.isAuthenticated {
        // ログイン後のページに遷移
        if viewModel.isAuthenticated {
          ContentView()
        }

      }
    }
  }
}
