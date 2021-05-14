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
        if newBook.isbn != "" { // FIXME: Doesnt work
            BookInfo()
        } else {
            ScannerView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
