//
//  PreView.swift
//  Marky
//
//  Created by Coni on 2025-06-30.
//
// haha this file name is a funny pun aint it

import SwiftUI
import Down

struct PreviewView: View {
    let markdownText: String

    var body: some View {
        MarkyDownView(markdown: markdownText)
            .frame(minWidth: 300, minHeight: 300)
            .background(Color(nsColor: .textBackgroundColor))
    }
}
