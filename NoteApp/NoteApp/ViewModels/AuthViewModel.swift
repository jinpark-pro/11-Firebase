//
//  AuthViewModel.swift
//  NoteApp
//
//  Created by Jungjin Park on 2024-07-23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class AuthViewModel: ObservableObject {
    @Published var user: User?
    
    func listenToAuthState() {
        // login 상태가 변동되면 알려줌
        // addStateDidChangeListener는 비동기로 인증상태가 변경된 이후에 호출
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else { return }
            self.user = user
        }
    }
    
    func signIn(emailAddress: String, password: String) {
        Auth.auth().signIn(withEmail: emailAddress, password: password) { result, error in
            if let error = error {
                print("error: \(error.localizedDescription)")
                return
            }
        }
    }
    
    func signUp(emailAddress: String, password: String) {
        Auth.auth().createUser(withEmail: emailAddress, password: password) { result, error in
            if let error = error {
                print("create error: \(error.localizedDescription)")
                return
            } else {
                print("user id: \(result?.user.uid ?? "-")")
                guard let uid = result?.user.uid else { return }
                Firestore.firestore().collection("Users").document(uid).setData(["email": emailAddress, "uid": uid]) { error in
                    if let error = error {
                        print(error)
                        return
                    }
                    print("Success to create user")
                }
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    func resetPassword(emailAddress: String) {
        Auth.auth().sendPasswordReset(withEmail: emailAddress) { error in
            if let error = error {
                print("Reset error: \(error.localizedDescription)")
            }
            print("Done")
        }
    }
}
