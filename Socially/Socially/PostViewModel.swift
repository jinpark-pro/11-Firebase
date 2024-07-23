//
//  PostViewModel.swift
//  Socially
//
//  Created by Jungjin Park on 2024-07-23.
//

import Combine
import FirebaseFirestore

class PostViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    private var databaseReference = Firestore.firestore().collection("Posts")
    
    func addData(description: String, datePublished: Date) async {
        do {
            _ = try await databaseReference.addDocument(data: [
                "description": description,
                "datePublished": datePublished
            ])
        } catch {
            print(error.localizedDescription)
        }
    }
}
