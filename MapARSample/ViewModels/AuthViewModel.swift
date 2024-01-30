import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
  @Published var isAuthenticated = false

  @Published var uid: String?
  @Published var userId: String?
  @Published var NickName: String?

  @StateObject var snsViewModel = SNSViewModel()

  // イニシャライザメソッドを呼び出して、アプリの起動時に認証状態をチェックする
  init() {
    observeAuthChanges()
  }

  private func observeAuthChanges() {
    Auth.auth().addStateDidChangeListener { [weak self] _, user in
      DispatchQueue.main.async {
        self?.isAuthenticated = user != nil
        self?.uid = user?.uid
      }
    }
  }
  // ログインするメソッド
  func signIn(email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
      DispatchQueue.main.async {
        if result != nil, error == nil {
          self?.isAuthenticated = true
          self?.uid = result?.user.uid
        }
      }
    }
  }



  // 新規登録するメソッド
  //  func signUp(email: String, password: String) {
  //    Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
  //      DispatchQueue.main.async {
  //        if result != nil, error == nil {
  //          self?.isAuthenticated = true
  //          self?.uid = result?.user.uid
  //        }
  //      }
  //    }
  //  }

  func signUp(email: String, password: String, NickName: String, userId: String){
    Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
      DispatchQueue.main.async{
        if let result = result, error == nil{
          self?.uid = result.user.uid
//          self?.userId = "sampleUserId"
//          self?.NickName = "sampleNickName"
          self?.NickName = NickName
          self?.userId = userId

          if let unwrappedUserUid = self?.uid,
             let unwrappedUserId = self?.userId,
             let unwrapperdNickName = self?.NickName{
              self?.snsViewModel.postUserData(uid: unwrappedUserUid, userId: unwrappedUserId, nickname:  unwrapperdNickName)
              self?.isAuthenticated = true

          }else{
            print("Nickname is nil")
          }
        }else{
          print("Eroor in sign up: \(error?.localizedDescription ?? "Unknown error")")
        }
      }
    }
  }



  // パスワードをリセットするメソッド
  func resetPassword(email: String) {
    Auth.auth().sendPasswordReset(withEmail: email) { error in
      if let error = error {
        print("Error in sending password reset: \(error)")
      }
    }
  }


  // ログアウトするメソッド
  func signOut() {
    do {
      try Auth.auth().signOut()
      isAuthenticated = false
      uid = nil
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
  }
}
