//
//  PreView.swift
//  Marky
//
//  Created by Coni on 2025-06-30.
//
// haha this file name is a funny pun aint it

import Foundation
import SwiftUI

struct PreviewView: View {
    @Environment(\.markdownText) private var markdownText
    var body: some View {
        let elements = parseMarkdown(markdownText)
        let html = renderHTML(from: elements)
        
        ScrollView {
            Text(html)
                .font(.system(.body, design: .monospaced))
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color(nsColor: .textBackgroundColor))
    }
}
