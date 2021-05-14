//
//  NewBook.swift
//  Bookscanner
//
//  Created by Luciano Nooijen on 14/05/2021.
//

import Foundation

class NewBook: ObservableObject {
    @Published var isbn: String = ""
    @Published var owner: String = ""
    @Published var category: String = ""
    
    func clear() {
        isbn = ""
        owner = ""
        category = ""
    }
    
    // TODO: Can this be done cleaner?
    func toNewBookData() -> NewBookData {
        return NewBookData(isbn: isbn, owner: owner, category: category)
    }
}

struct NewBookData: Codable {
    var isbn: String
    var owner: String
    var category: String
}
