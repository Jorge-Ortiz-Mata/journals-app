//
//  CreateJournalView.swift
//  Day Journal
//
//  Created by Jorge on 11/01/24.
//

import SwiftUI

struct CreateJournalView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    @State var name: String = ""
    @State var text: String = ""
    @State var rating: Double = 1.0
    @State var journalDate: Date = Date()
    
    
    var body: some View {
        NavigationStack {
            Form {
                VStack {
                    TextField("My favorite subject", text: $name)
                }
                .padding(.bottom, 20)
                VStack {
                    DatePicker(
                        "Date:",
                        selection: $journalDate,
                        displayedComponents: .date
                    )
                }
                .padding(.bottom, 20)
                VStack {
                    TextEditor(text: $text)
                        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                }
                .padding(.bottom, 20)
                VStack {
                    Slider(value: $rating, in: 1...5, step: 1)
                    Text(String(rating))
                }
                
            }
            .navigationTitle("New Journal")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        addJournal()
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func addJournal() {
        withAnimation {
            let newJournal = Journal(
                name: name,
                text: text,
                rating: rating,
                journalDate: journalDate
            )
            modelContext.insert(newJournal)
        }
    }
}

#Preview {
    CreateJournalView()
}
