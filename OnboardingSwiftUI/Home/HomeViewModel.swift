import Foundation

class HomeViewModel: HomeProtocol {
    
    private let service: Service
    private let loginService: LoginService

    init(service: Service, loginService: LoginService) {
        self.service = service
        self.loginService = loginService
    }
    
    @Published var posts: [Post] = [Post]()
    
    func logout() {
        loginService.logout()
    }
    
    func fetchData() {
        service.fetchData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let result):
                    self?.posts = result
                case.failure(let error):
                    print(error)
                }
            }
        }
    }
    
    @MainActor
    func fetchData1() async {
        posts = await service.fetchData1()
    }
}
