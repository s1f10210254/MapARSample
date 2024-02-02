import SwiftUI
import Firebase

struct MainView: View {
    @EnvironmentObject var viewModel: AppViewModel // AppViewModelを利用

    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            Button("ログアウト") {
                logout()
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }

    private func logout() {
        do {
            try Auth.auth().signOut()
            // ログアウト成功後、アプリの状態を更新
            DispatchQueue.main.async {
                viewModel.currentUserState = .notLoggedIn
            }
        } catch let signOutError as NSError {
            print("ログアウトエラー: \(signOutError.localizedDescription)")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(AppViewModel())
    }
}

