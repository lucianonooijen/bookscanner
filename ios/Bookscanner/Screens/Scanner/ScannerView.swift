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

struct ScannerView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        Scanner()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
