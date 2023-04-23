
import Foundation


class Service {
    
    private enum Constants {
        static let apiKey = "c8yPowaUM1rFmI1DRdfBEdZ5UCWkF7t6gRVBzEWW5ykXpEQjei"
      }
    
    func fetchData(didFinish: @escaping (Result<[Post], Error>) -> Void) {
        
        guard let url = URL(string: "https://api.tumblr.com/v2/blog/marvelentertainment.tumblr.com/posts/link?api_key=\(Constants.apiKey)") else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error fetching data \(error.localizedDescription)")
                didFinish(.failure(error))
            }
            guard let jsonData = data else { return }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let decodedData = try decoder.decode(TumblrPost.self, from: jsonData)
                didFinish(.success(decodedData.response.posts))
             } catch {
                print(error)
                 didFinish(.failure(error))
            }
        }
        dataTask.resume()
    }
    
    func fetchData1() async -> [Post] {
        
        guard let url = URL(string: "https://api.tumblr.com/v2/blog/marvelentertainment.tumblr.com/posts/link?api_key=\(Constants.apiKey)") else { return [] }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let jsonData = data
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(TumblrPost.self, from: jsonData)
            return decodedData.response.posts
        } catch let error{
                print("Error fetching data \(error.localizedDescription)")
            return []
        }
    }
}
