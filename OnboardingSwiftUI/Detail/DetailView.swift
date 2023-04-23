import SwiftUI

struct DetailView: View {
    
    var post: Post
    
    var body: some View {
        VStack {
            DetailImage(urlForImage: post.linkImage?.absoluteString ?? Constants.imageLink)
                .padding(.bottom, 50)
            Text(post.blog.description ?? "No description")
        }
        Spacer()
    }
}

struct DetailImage: View {
    let urlForImage: String
    
    var body: some View {
        AsyncImage(url: URL(string: urlForImage)) { image in
            image
                .resizable()
        } placeholder: {
            Color.gray
        }.frame(width: 300, height: 200)
    }
}
