//
//  ScannerView.swift
//  Bookscanner
//
//  Created by Luciano Nooijen on 26/03/2021.
//

import Foundation
import SwiftUI

// Sources:
// - https://www.avanderlee.com/swiftui/integrating-swiftui-with-uikit/
// - https://www.answertopia.com/swiftui/integrating-uiviews-with-swiftui/

class ScannerDelegateImplementation: ScannerDelegate {
    @ObservedObject var newBook: NewBook
    
    init(newBook: NewBook) {
        self.newBook = newBook
    }
    
    internal func saveIsbn(_ isbn: String) {
        print("saveIsbn is called with ISBN: \(isbn)")
        newBook.isbn = isbn
    }
}

struct ScannerView: UIViewRepresentable {
    @ObservedObject var newBook: NewBook
    
    func makeUIView(context: Context) -> some UIView {
        {
            let scan = Scanner()
            scan.delegate = ScannerDelegateImplementation(newBook: newBook)
            return scan
        }()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("ScannerView's updateUIView is called")
    }
}
