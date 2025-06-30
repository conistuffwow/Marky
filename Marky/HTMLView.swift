//
//  SwiftUIView.swift
//  Marky
//
//  Created by Coni on 2025-06-30.
//

import SwiftUI
import WebKit
import Down

struct MarkyDownView: NSViewRepresentable {
    let markdown: String
    
    class Coordinator {
        var downView: DownView?
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func makeNSView(context: Context) -> NSView {
        do {
            let downView = try DownView(frame: .zero, markdownString: markdown, openLinksInBrowser: true)
            return downView
        } catch {
            let fallback = NSTextView()
            fallback.string = "Error rendering Markdown: \(error.localizedDescription)"
            return fallback
        }
    }
    func updateNSView(_ nsView: NSView, context: Context) {
        if let downView = nsView as? DownView {
            try? downView.update(markdownString: markdown)
        }
    }
}

