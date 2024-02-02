import SwiftUI

struct AppView: View {
  @EnvironmentObject var viewModel: AppViewModel

  var body: some View {
    Group {
      switch viewModel.currentUserState {
      case .unknown:
        ProgressView()
          .progressViewStyle(CircularProgressViewStyle())
          .scaleEffect(2)
          .padding()

      case .notLoggedIn:
        HelloView()

      case .loggedInButProfileNotCompleted:
        ProfileSetupView()
          .environmentObject(viewModel) // ViewModelを渡す

      case .loggedInAndProfileCompleted:
        MainView()
          .environmentObject(viewModel) // ViewModelを渡す
      }
    }
    .onAppear {
      viewModel.checkCurrentUser()
    }
  }
}

