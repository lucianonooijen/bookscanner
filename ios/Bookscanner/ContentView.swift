//
//  ContentView.swift
//  Bookscanner
//
//  Created by Luciano Nooijen on 26/03/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var newBook = NewBook()
    
    var body: some View {
        // TODO: Clean up, use navigator with transitions etc.
        if newBook.isbn != "" {
            BookInfo(newBook: newBook)
        } else {
            ScannerView(newBook: newBook)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
