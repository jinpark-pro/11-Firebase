//
//  HolderView.swift
//  NoteApp
//
//  Created by Jungjin Park on 2024-07-23.
//

import SwiftUI

struct HolderView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    
    var body: some View {
        Group {
            if authModel.user == nil {
                SignUpView()
            } else {
                ContentView()
            }
        }
        .onAppear {
            authModel.listenToAuthState()
        }
    }
}

#Preview {
    HolderView()
        .environmentObject(AuthViewModel())
}
