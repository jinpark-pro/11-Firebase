//
//  Post.swift
//  Socially
//
//  Created by Jungjin Park on 2024-07-23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    var description: String?
    var imageURL: String?
    // 서버에 데이터가 도착한 순서로 뒤섞임을 최소화
    // 버벅임이 발생할 수 있음
    @ServerTimestamp var datePublished: Date?
}
