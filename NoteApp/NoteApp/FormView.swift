//
//  FormView.swift
//  NoteApp
//
//  Created by Jungjin Park on 2024-07-22.
//

import SwiftUI

struct FormView: View {
    @EnvironmentObject var viewModel: NoteViewModel
    
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
                        viewModel.addData(title: titleText)
                        titleText = ""
                        dismiss()
                    }) {
                        Text("Save now")
                    }
                    .foregroundStyle(.yellow)
                    .disabled(titleText.isEmpty)
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
