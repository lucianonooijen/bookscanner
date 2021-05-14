//
//  NewBook.swift
//  Bookscanner
//
//  Created by Luciano Nooijen on 14/05/2021.
//

import Foundation

// FIXME: Add Codable
class NewBook: ObservableObject {
    @Published var isbn: String = ""
    @Published var owner: String = ""
    @Published var category: String = ""
}
