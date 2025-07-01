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
    @State private var tabs: [MarkdownTab] = [
        .init(name: "Untitled", text: "# New File", url: nil)
    ]
    @State private var selectedTab: MarkdownTab? = nil
    var body: some Scene {
        WindowGroup {
            MarkyView(isSaving: $isSaving, isLoading: $isLoading)
        }
        .commands {
            MarkyCmds(isSaving: $isSaving, isLoading: $isLoading)
        }
    }
}
