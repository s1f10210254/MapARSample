import Foundation
import FirebaseAuth

class AppViewModel2: ObservableObject {
    @Published var signedIn = false

    var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }

    init() {
        self.signedIn = isSignedIn
    }

    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }

            DispatchQueue.main.async {
                // 成功した場合、signedInをtrueに設定
                self?.signedIn = true
            }
        }
    }

    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }

            DispatchQueue.main.async {
                // 成功した場合、signedInをtrueに設定
                self?.signedIn = true
            }
        }
    }

    func signOut() {
        try? Auth.auth().signOut()

        self.signedIn = false
    }
}

