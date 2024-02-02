import SwiftUI
import Firebase
import FirebaseFirestore

class AppViewModel: ObservableObject {
  @Published var currentUserState: UserState = .unknown

  init(){
    self.checkCurrentUser()
  }

  func checkCurrentUser(){
    if let user = Auth.auth().currentUser {
      //ログイン済みユーザのプロフィール完了状態をチェック
      let db = Firestore.firestore()
      let docRef = db.collection("users").document(user.uid)

      docRef.getDocument { (document, error) in
        if let document = document, document.exists {
          // プロフィールが存在する場合
          self.currentUserState = .loggedInAndProfileCompleted
        } else{
          // プロフィールが存在しない場合
          self.currentUserState = .loggedInButProfileNotCompleted
        }
      }
    }else{
      //ログインしていない場合
      self.currentUserState = .notLoggedIn
    }
  }
  private func checkUserProfile(uid: String) {
    let db = Firestore.firestore()
    db.collection("users").document(uid).getDocument { [weak self] document, error in
      guard let self = self else { return }

      DispatchQueue.main.async {
        if let document = document, document.exists {
          self.currentUserState = .loggedInAndProfileCompleted
        } else {
          self.currentUserState = .loggedInButProfileNotCompleted
        }
      }
    }
  }
  enum UserState {
    case unknown // 初期状態またはチェック中
    case notLoggedIn // ログインしていない
    case loggedInButProfileNotCompleted // ログイン済みだがプロフィール未完了
    case loggedInAndProfileCompleted // ログイン済みでプロフィールも完了
  }
}
