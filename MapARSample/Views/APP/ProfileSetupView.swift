import SwiftUI
import Firebase
import FirebaseFirestore

struct ProfileSetupView: View {
  @EnvironmentObject var viewModel: AppViewModel
  @State private var username: String = ""
  @State private var displayName: String = ""
  @State private var userId: String = ""
  @State private var errorMessage: String?

  var body: some View {
    VStack {
      Text("プロフィール設定").font(.title)
      TextField("ユーザー名", text: $username)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()

      TextField("表示名", text: $displayName)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()

      TextField("ユニークなユーザーID", text: $userId)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()

      if let errorMessage = errorMessage {
        Text(errorMessage)
          .foregroundColor(.red)
          .padding()
      }

      Button("プロフィールを設定") {
        setupProfile()
      }
      .padding()
    }
    .padding()
  }

  private func setupProfile() {
    checkUserIdUnique(userId: self.userId) { isUnique in
      if isUnique {
        // ユーザーIDがユニークであれば、Firestoreにユーザー情報を保存
        guard let currentUser = Auth.auth().currentUser else { return }
        let db = Firestore.firestore()
        db.collection("users").document(currentUser.uid).setData([
          "username": self.username,
          "displayName": self.displayName,
          "userId": self.userId
        ]) { error in
          if let error = error {
            self.errorMessage = "データベース保存エラー: \(error.localizedDescription)"
          } else {
            // 保存成功
            UserDefaults.standard.set(false, forKey: "isNewUser")
            viewModel.checkCurrentUser() // ユーザー状態を再チェック
          }
        }
      }else{
        self.errorMessage = "このユーザIDはすでに使用されています。別のIDをお試しください"
      }
    }
  }

  private func checkUserIdUnique(userId: String, completion: @escaping (Bool) -> Void) {
    let db = Firestore.firestore()
    db.collection("users").whereField("userId", isEqualTo: userId).getDocuments { snapshot, error in
      if let error = error {
        self.errorMessage = "ユーザーIDチェックエラー: \(error.localizedDescription)"
        completion(false)
      } else if let snapshot = snapshot, snapshot.documents.isEmpty {
        completion(true) // ユーザーIDはユニーク
      } else {
        completion(false) // ユーザーIDは既に存在
      }
    }
  }
}

struct ProfileSetupView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileSetupView()
  }
}

