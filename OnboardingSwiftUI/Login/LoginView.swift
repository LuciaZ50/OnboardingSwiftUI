
import SwiftUI

struct LoginView<T: LoginViewModel>: View {
    
    @ObservedObject private var viewModel: T
    
    init(viewModel: T) {
        self.viewModel = viewModel
    }
    
    let homeVM = HomeViewModel(service: Service(), loginService: LoginService())
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: HomeView(viewModel: homeVM), label: {
                Button("Login", action: login)
                    .frame(width: 100, height: 50)
                    .buttonStyle(.bordered)
                    .tint(.mint)
            })
        }
    }
    
    func login() {
       print("Login tapped")
        viewModel.logIn()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel(service: LoginService()))
    }
}

