//
//  Post.swift
//  Socially-UIKit
//
//  Created by Jungjin Park on 2024-07-25.
//

import Foundation
import FirebaseFirestore

struct Post: Hashable, Identifiable, Decodable {
    @DocumentID var id: String?
    var description: String?
    var imageURL: String?
    @ServerTimestamp var datePublished: Date?
}
