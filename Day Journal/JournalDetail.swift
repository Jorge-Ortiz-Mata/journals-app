//
//  JournalDetail.swift
//  Day Journal
//
//  Created by Jorge on 11/01/24.
//

import SwiftUI

struct JournalDetail: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    let journal: Journal
    @State var showConfirmation: Bool = false
    @State var isEditing: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text("Rating:")
                    Text(String(repeating: "⭐️", count: Int(journal.rating)))
                    Spacer()
                }
                .padding(.bottom, 10)
                HStack {
                    Text("Date:")
                    Text(journal.journalDate, style: .date)
                    Text(journal.journalDate, style: .time)
                    Spacer()
                }
                .padding(.bottom, 10)
                Text(journal.text)
            }
            .padding()
            .navigationTitle(journal.name)
            .sheet(isPresented: $isEditing) {
                EditJournalView(
                    journal: journal,
                    name: journal.name,
                    text: journal.text,
                    rating: journal.rating,
                    journalDate: journal.journalDate
                )
            }
            .toolbar {
                Button("Delete") {
                    
                    showConfirmation.toggle()
                }
                .foregroundColor(.red)
                .confirmationDialog("Delete Journal", isPresented: $showConfirmation) {
                    Button("Yes") {
                        modelContext.delete(journal)
                        dismiss()
                    }
                    Button("No", role: .cancel) { }
                } message: {
                    Text("Are you sure to delete this journal?")
                }
                
                Button("Edit") {
                    isEditing = true
                }
            }
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        JournalDetail(
            journal: Journal(
                name: "Math is awesome",
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                rating: 4.0,
                journalDate: Date()
            )
        )
    }
}
