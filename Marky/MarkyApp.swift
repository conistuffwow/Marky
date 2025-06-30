//
//  MarkyApp.swift
//  Marky
//
//  Created by Coni on 2025-06-30.
//

import SwiftUI

@main
struct MarkyApp: App {
    @State private var isSaving = false
    @State private var isLoading = false
    var body: some Scene {
        WindowGroup {
            MarkyView(isSaving: $isSaving, isLoading: $isLoading)
        }
        .commands {
            MarkyCmds(isSaving: $isSaving, isLoading: $isLoading)
        }
    }
}
