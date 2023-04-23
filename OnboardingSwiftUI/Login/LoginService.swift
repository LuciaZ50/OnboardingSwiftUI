
import Foundation

class LoginService: ObservableObject {
        
    private enum Constants {
        static let user = "user"
    }
    let userDefaults = UserDefaults()
    @Published var isLoggedIn: Bool
    
    init() {
        self.isLoggedIn = userDefaults.bool(forKey: Constants.user)
    }
    
    func logIn() {
        userDefaults.set(true, forKey: Constants.user)
        isLoggedIn = true
        print("Tapped LOGIN")
    }
    
    func logout() {
        userDefaults.set(false, forKey: Constants.user)
        isLoggedIn = false
        print("Tapped LOGOUT")
    }
    
}
