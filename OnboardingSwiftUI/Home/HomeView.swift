
import SwiftUI

struct HomeView<T: HomeViewModel>: View {
    
    @ObservedObject private var viewModel: T
    
    init(viewModel: T) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                NavigationLink(destination: DetailView(post: post), label: {
                    CustomCell(title: post.title ?? "title", urlForImage: post.linkImage?.absoluteString ?? Constants.imageLink)
                })
                .navigationTitle(Constants.title)
            }
            .toolbar {
                Button("Logout") {
                    viewModel.logout()
                }
                .foregroundColor(.black)
            }
            .toolbarBackground(Color(.systemMint), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .task {
            await viewModel.fetchData1()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(service: Service(), loginService: LoginService()))
            .environment(\.colorScheme, .light)
        HomeView(viewModel: HomeViewModel(service: Service(), loginService: LoginService()))
            .environment(\.colorScheme, .dark)
    }
}

struct CustomCell: View {
    var title: String
    let urlForImage: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: urlForImage)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.gray
            }.frame(width: 50, height: 50)
        
            Text(title)
                .fontWeight(.semibold)
                .frame(height: 50, alignment: .leading)
                .lineLimit(2)
        }
    }
}
