//
//  EditorView.swift
//  Marky
//
//  Created by Coni on 2025-06-30.
//

import Foundation
import SwiftUI

struct EditorView: View {
    
    var body: some View {
        HStack {
            TextEditor(text: "# Untitled")
                .font(.system(.body, design: .monospaced))
                .padding()
        }

    }
}
