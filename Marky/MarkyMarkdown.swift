//
//  MarkyMarkdown.swift
//  Marky
//
//  Created by Coni on 2025-06-30.
//

import Foundation

enum MarkdownElement {
    case heading(level: Int, text: String)
    case paragraph(String)
}

func parseMarkdown(_ input: String) -> [MarkdownElement] {
    let lines = input.split(separator: "\n", omittingEmptySubsequences: false)
    var elements: [MarkdownElement] = []
    
    for line in lines {
        if line.hasPrefix("# ") {
            let level = line.prefix(while: {$0 == "#"}).count
            let text = line.drop(while: { $0 == "#" }).trimmingCharacters(in: .whitespaces)
            elements.append(.heading(level: level, text: text))
            
        } else if !line.trimmingCharacters(in: .whitespaces).isEmpty {
            elements.append(.paragraph(String(line)))
        }
    }
    return elements
}

func renderHTML(from elements: [MarkdownElement]) -> String {
    elements.map { element in
        switch element {
        case .heading(let level, let text):
            return "<h\(level)>\(text)</h\(level)>"
        case .paragraph(let text):
            return "<p>\(text)</p>"
        }
    }.joined(separator: "\n")
}
