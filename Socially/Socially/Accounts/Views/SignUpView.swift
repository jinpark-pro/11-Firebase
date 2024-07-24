//
//  SignUpViewModel.swift
//  Socially
//
//  Created by Jungjin Park on 2024-07-23.
//

import SwiftUI
import AuthenticationServices
import FirebaseAuth
import FirebaseFirestore

struct SignUpView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    
    var body: some View {
        VStack {
            SignInWithAppleButton(onRequest: authModel.signInWithApple(request:),
                                  onCompletion: authModel.signInWithAppleCompletion(result:))
            .signInWithAppleButtonStyle(.black)
            .frame(width: 290, height: 45, alignment: .center)
        }
    }
}

#Preview {
    SignUpView()
}
