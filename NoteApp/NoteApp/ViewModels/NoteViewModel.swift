//
//  NoteViewModel.swift
//  NoteApp
//
//  Created by Jungjin Park on 2024-07-22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NoteViewModel: ObservableObject {
    @Published var notes = [Note]()
    @Published var selectedNote = Note()
    private lazy var databaseReference: CollectionReference? = {
        guard let userId = Auth.auth().currentUser?.uid else { return nil }
        // add post into a collection of userId
        let ref = Firestore.firestore().collection("Notes").document(userId).collection("Posts")
        return ref
    }()
    
    func addData(title: String) {
        let docRef = databaseReference?.addDocument(data: ["title": title])
        dump(docRef)
    }
    
    func fetchData() {
        // snapshotlistener: firestore 에서 지속적으로 메모리에 떠있으면서 변화 관찰
        databaseReference?.addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents : \(error?.localizedDescription ?? "-")")
                return
            }
            // nosql 은 (key: value) 로 값이 없을수도 있으므로 optional
            self.notes = documents.compactMap { docSnap -> Note? in
                return try? docSnap.data(as: Note.self)
            }
        }
    }
    
    func updateData(title: String, id: String) {
        databaseReference?.document(id).updateData(["title": title]) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Note update successed")
            }
        }
    }
    
    func deleteData(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let note = notes[index]
            
            databaseReference?.document(note.id ?? "").delete { error in
                if let error = error {
                    print("\(error.localizedDescription)")
                } else {
                    print("Note with ID \(note.id ?? "") deleted")
                }
            }
        }
    }
}