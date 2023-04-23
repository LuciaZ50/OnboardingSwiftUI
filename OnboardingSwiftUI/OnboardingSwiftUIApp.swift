
import SwiftUI

@main
struct OnboardingSwiftUIApp: App {
    private let service = Service()
    @StateObject private var loginService = LoginService()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if loginService.isLoggedIn {
                    let homeVM = HomeViewModel(service: service, loginService: loginService)
                    HomeView(viewModel: homeVM)
                } else {
                    let loginVM = LoginViewModel(service: loginService)
                    LoginView(viewModel: loginVM)
                }
            }
        }
    }
}

