//
//  Note.swift
//  NoteApp
//
//  Created by Jungjin Park on 2024-07-22.
//

import Foundation
import FirebaseFirestoreSwift

struct Note: Codable {
    @DocumentID var id: String?
    var title: String?
}
