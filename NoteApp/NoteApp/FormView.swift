//
//  FormView.swift
//  NoteApp
//
//  Created by Jungjin Park on 2024-07-22.
//

import SwiftUI

struct FormView: View {
    @Environment(\.dismiss) var dismiss
    @State var titleText = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextEditor(text: $titleText)
                        .frame(minHeight: 200)
                }
                Section {
                    Button(action: {
                        
                    }) {
                        Text("Save now")
                    }
                    .disabled(titleText.isEmpty)
                    .foregroundStyle(.yellow)
                }
            }
            .navigationTitle("Publish")
            .toolbar {
                ToolbarItemGroup(placement: .destructiveAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    FormView()
}
