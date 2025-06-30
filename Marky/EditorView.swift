//
//  EditorView.swift
//  Marky
//
//  Created by Coni on 2025-06-30.
//

import Foundation
import SwiftUI

struct EditorView: View {
    @Binding var tab: MarkdownTab
    
    var body: some View {
        HStack {
            TextEditor(text: $tab.text)
                .font(.system(.body, design: .monospaced))
                .padding()
        }
        .navigationTitle(tab.name)
    }
}
