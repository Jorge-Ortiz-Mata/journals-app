//
//  JournalRow.swift
//  Day Journal
//
//  Created by Jorge on 11/01/24.
//

import SwiftUI

struct JournalRow: View {
    let journal: Journal
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(journal.name)
                    .bold()
                    .font(.body)
                Text("-")
                Text(journal.text)
                    .lineLimit(1)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(.bottom, 5)
            Text(String(repeating: "⭐️", count: Int(journal.rating)))
                .font(.caption)
        }
    }
}

#Preview {
    List {
        JournalRow(
            journal: Journal(
                name: "I broke a window",
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                rating: 4,
                journalDate: Date()
            )
        )
    }
}
