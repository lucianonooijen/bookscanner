//
//  Owner.swift
//  Bookscanner
//
//  Created by Luciano Nooijen on 14/05/2021.
//

import SwiftUI

// TODO: Use enum for options

var ownerOptions = [
    "Bytecode",
    "Luciano",
    "Chris",
    "Suzanne",
    "Unknown"
]
var categoryOptions = [
    "Software",
    "Philosophy",
    "Fiction",
    "SoftSkills",
    "Business",
    "Mathematics",
    "Sales",
    "Economy",
    "Politics",
    "History",
    "Biography",
    "Languages",
    "Dictionary"
]

struct BookInfo: View {
    @ObservedObject var newBook: NewBook
    
    // TODO: This can be extracted to conform to single responsibility principle
    func saveBook() {
        let apiCaller = ApiCalls()
        apiCaller.saveNewBook(book: newBook)
        newBook.clear()
    }
    
    var body: some View {
        NavigationView{
            Form {
                
                // Owner picker
                Section {
                    Picker("Owner", selection: $newBook.owner) {
                        ForEach(ownerOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                }
                
                // Category picker
                Section {
                    Picker("Category", selection: $newBook.category) {
                        ForEach(categoryOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                }
                
                // Display selected options
                Section {
                    HStack(spacing: 10) {
                        Text("ISBN:").foregroundColor(.gray)
                        Text(newBook.isbn)
                    }
                    HStack(spacing: 10) {
                        Text("Owner:").foregroundColor(.gray)
                        Text(newBook.owner)
                    }
                    HStack(spacing: 10) {
                        Text("Category:").foregroundColor(.gray)
                        Text(newBook.category)
                    }
                }
                
                // Completion button
                Section {
                    Button(action: {saveBook()}) {
                        Text("Save book to server")
                    }.disabled(newBook.isbn == "" || newBook.owner == "" || newBook.category == "")
                }
                
            // End of Form
            }.navigationBarTitle("Book info")
        }
    }
}

struct BookInfo_Previews: PreviewProvider {
    @ObservedObject static var newBook: NewBook = NewBook()
    
    static var previews: some View {
        BookInfo(newBook: newBook)
    }
}
