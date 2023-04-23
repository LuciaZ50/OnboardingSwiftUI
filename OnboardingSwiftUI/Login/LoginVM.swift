
import Foundation

class LoginViewModel: LoginProtocol {
    
    private let service: LoginService
    
    init(service: LoginService) {
        self.service = service
    }
    
    func logIn() {
        service.logIn()
    }
    
    func logout() {
        service.logout()
    }
}
