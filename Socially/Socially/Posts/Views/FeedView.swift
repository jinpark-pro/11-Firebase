//
//  FeedView.swift
//  Socially
//
//  Created by Jungjin Park on 2024-07-23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct FeedView: View {
    @EnvironmentObject private var authModel: AuthViewModel
//    @EnvironmentObject private var postModel: PostViewModel
    
    @FirestoreQuery(
        collectionPath: "Posts",
        predicates: [.order(by: "description", descending: false),
                     .order(by: "datePublished", descending: true)]
    ) var posts: [Post]
    
    @State var showingPosts: Bool = false
    
    var body: some View {
        NavigationStack {
            List(posts) { post in
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: post.imageURL ?? "")) { phase in
                        switch phase {
                        case .empty:
                            EmptyView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 200)
                                .clipped()
                        case .failure:
                            Image(systemName: "photo")
                        @unknown default:
                            EmptyView()
                        }
                    }
                    VStack(alignment: .leading) {
                        Text(post.description ?? "")
                            .font(.headline)
                            .padding(22)
                        Text("Published on the \(post.datePublished?.formatted() ?? "")")
                            .font(.caption)
                    }
                }
                .frame(minHeight: 100, maxHeight: 350)
            }
            .navigationTitle("Feed")            
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        authModel.signOut()
                    } label: {
                        Text("Sign out")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        showingPosts = true
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
            .sheet(isPresented: $showingPosts) {
                PostView().presentationDetents([.medium, .large])
            }
        }
    }
}

#Preview {
    FeedView()
        .environmentObject(PostViewModel())
}
