//
//  MarkyApp.swift
//  Marky
//
//  Created by Coni on 2025-06-30.
//

import SwiftUI

@main
struct MarkyApp: App {
<<<<<<< HEAD
    @State private var isSaving = false
    @State private var isLoading = false
    @State private var tabs: [MarkdownTab] = [
        .init(name: "Untitled", text: "# New File", url: nil)
    ]
    @State private var selectedTab: MarkdownTab? = nil
=======
>>>>>>> parent of a9a2832 (MD saving and loading)
    var body: some Scene {
        WindowGroup {
            MarkyView()
        }
    }
}
