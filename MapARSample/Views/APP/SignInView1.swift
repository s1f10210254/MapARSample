import SwiftUI
import Firebase
import FirebaseFirestore

struct SignInView1: View {
  @EnvironmentObject var viewModel: AppViewModel // AppViewModelを利用
  @State private var email: String = ""
  @State private var password: String = ""
  @State private var errorMessage: String?
  var body: some View {
    VStack(spacing: 20){
      Text("ログイン").font(.title)
      TextField("メールアドレス", text: $email)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .autocapitalization(.none)
        .padding()

      SecureField("パスワード", text: $password)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()

      if let errorMessage = errorMessage {
        Text(errorMessage)
          .foregroundColor(.red)
      }
      Button("ログイン") {
        signIn()
      }
      .padding()
      .background(Color.blue)
      .foregroundColor(.white)
      .cornerRadius(10)
    }
    .padding()
  }

  private func signIn() {
    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
      if let error = error {
        self.errorMessage = error.localizedDescription
      } else {
        // ログイン成功後、プロフィールが設定されているかチェック
        self.checkUserProfile()
      }
    }
  }

  private func checkUserProfile() {
    guard let uid = Auth.auth().currentUser?.uid else { return }
    let db = Firestore.firestore()
    db.collection("users").document(uid).getDocument { document, error in
      if let document = document, document.exists {
        // プロフィールが存在する場合
        DispatchQueue.main.async {
          self.viewModel.currentUserState = .loggedInAndProfileCompleted
        }
      } else {
        // プロフィールが存在しない場合
        DispatchQueue.main.async {
          self.viewModel.currentUserState = .loggedInButProfileNotCompleted
        }
      }
    }
  }

}

struct SignInView_Previews: PreviewProvider {
  static var previews: some View {
    SignInView1()
  }
}
