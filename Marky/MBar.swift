//
//  MBar.swift
//  Marky
//
//  Created by Coni on 2025-06-30.
//

import Foundation
import SwiftUI

struct MarkyCmds: Commands {
    @Binding var isSaving: Bool
    @Binding var isLoading: Bool
    
    var body: some Commands {
        CommandGroup(replacing: .newItem) {
            Button("Open...") {
                isLoading = true
            }
            .keyboardShortcut("o", modifiers: [.command])
            
            Button("Save") {
                isSaving = true
            }
            .keyboardShortcut("s", modifiers: [.command])
            
            
        }
    }
}
