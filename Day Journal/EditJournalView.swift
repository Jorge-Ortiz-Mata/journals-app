//
//  EditJournalView.swift
//  Day Journal
//
//  Created by Jorge on 11/01/24.
//

import SwiftUI
import SwiftData

struct EditJournalView: View {
    @Environment(\.dismiss) var dismiss
    @State var journal: Journal
    @State var name: String
    @State var text: String
    @State var rating: Double
    @State var journalDate: Date
    
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
            .navigationTitle("Edit Journal")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        journal.name = name
                        journal.text = text
                        journal.rating = rating
                        journal.journalDate = journalDate
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    EditJournalView(
        journal: Journal(
            name: "Math is great",
            text: "Some description about this journal with more content to see the design within the form.",
            rating: 3.0,
            journalDate: Date()
        ),
        name: "Math is great",
        text: "Some description about this journal with more content to see the design within the form.",
        rating: 3.0,
        journalDate: Date()
    )
}
