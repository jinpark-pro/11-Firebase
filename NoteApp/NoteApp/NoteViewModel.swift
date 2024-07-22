//
//  NoteViewModel.swift
//  NoteApp
//
//  Created by Jungjin Park on 2024-07-22.
//

import Foundation
import FirebaseFirestore

class NoteViewModel: ObservableObject {
    @Published var notes = [Note]()
    
    private var databaseReference = Firestore.firestore().collection("Notes")
}
