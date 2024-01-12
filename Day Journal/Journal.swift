//
//  Journal.swift
//  Day Journal
//
//  Created by Jorge on 11/01/24.
//

import Foundation
import SwiftData

@Model
final class Journal {
    var name: String
    var text: String
    var rating: Double
    var journalDate: Date = Date()
    
    init(name: String, text: String, rating: Double, journalDate: Date) {
        self.name = name
        self.text = text
        self.rating = rating
        self.journalDate = journalDate
    }
}

//let journalsData: [Journal] = [
//    Journal(
//        name: "I broke a window",
//        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//        rating: 4,
//        journalDate: Date()
//    ),
//    Journal(
//        name: "Math is great",
//        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//        rating: 5,
//        journalDate: Date.now.addingTimeInterval(-1 * 24 * 60 * 60)
//    ),
//    Journal(
//        name: "Cancun, my fav beach",
//        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//        rating: 4,
//        journalDate: Date.now.addingTimeInterval(-3 * 24 * 60 * 60)
//    ),
//]
