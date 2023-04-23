
import Foundation

struct TumblrPost: Codable {
    let response: Posts
}

struct Posts: Codable {
    let posts: [Post]
}

struct Post: Codable, Identifiable {
    
    let title: String?
    let linkImage: URL?
    let blog: Blog
    var idString: String?
    var id: String {
        return idString ?? UUID().uuidString
    }
}

struct Blog: Codable {
    let description: String?
}
