//
//  AuthViewModel.swift
//  NoteApp
//
//  Created by Jungjin Park on 2024-07-23.
//

import Foundation
import FirebaseAuth

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
}
