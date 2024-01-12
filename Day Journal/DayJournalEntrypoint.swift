//
//  ContentView.swift
//  Day Journal
//
//  Created by Jorge on 11/01/24.
//

import SwiftUI
import SwiftData

struct DayJournalEntrypoint: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Journal.rating, order: .reverse) private var journals: [Journal]
    @State var showSheet: Bool =  false
    
    var body: some View {
        NavigationStack {
            List(journals) { journal in
                NavigationLink(
                    destination: JournalDetail(journal: journal)
                ) {
                    JournalRow(journal: journal)
                }
            }
            .toolbar {
                ToolbarItem {
                    Button(action: showCreateJournalView) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("\(journals.count) - Journals")
            .sheet(isPresented: $showSheet) {
                CreateJournalView()
            }
        }
    }
    
    private func showCreateJournalView() {
        showSheet = true
    }
    
    private func deleteJournal(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(journals[index])
            }
        }
    }
}

#Preview {
    DayJournalEntrypoint()
        .modelContainer(for: Journal.self, inMemory: true)
}
