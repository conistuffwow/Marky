//
//  MainMarky.swift
//  Marky
//
//  Created by Coni on 2025-06-30.
//

import Foundation
import SwiftUI

struct MarkyView: View {
    @State private var defaultText: String = "# New File"
    @State private var showPreview: Bool = false
    
    var body: some View {
        NavigationSplitView {
            
        } content: {
            if showPreview {
                Text("todo")
            } else {
                TextEditor(text: $defaultText)
                    .font(.system(.body, design: .monospaced))
                    .padding(8)
                    .background(Color(NSColor.textBackgroundColor))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        } detail: {
            PreviewView()
                .environment(\.markdownText, defaultText)
        }
        .navigationTitle("untitled.md")
        .toolbar {
            ToolbarItemGroup {
                Spacer()
                Button(action: saveDoc) {
                    Label("Save", systemImage: "square.and.arrow.down")
                }
            }
        }
    }
    
    func togglePreview() {
        showPreview.toggle()
    }
    
    func saveDoc() {
        // todo
    }
}
