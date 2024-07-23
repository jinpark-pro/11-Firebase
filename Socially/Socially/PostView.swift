//
//  PostView.swift
//  Socially
//
//  Created by Jungjin Park on 2024-07-23.
//

import SwiftUI

struct PostView: View {
    @EnvironmentObject private var viewModel: PostViewModel
    
    @State private var description = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Description", text:$description)
                }
                Section {
                    Button(action: {
                        // MARK: Post data to Firestore
                        Task {
                            await self.viewModel.addData(description: description, datePublished: Date())
                        }
                    }) {
                        Text("Post")
                    }
                }
            }
            .navigationTitle("New Post")
        }
    }
}

#Preview {
    PostView()
}
