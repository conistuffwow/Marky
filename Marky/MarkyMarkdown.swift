//
//  MarkyMarkdown.swift
//  Marky
//
//  Created by Coni on 2025-06-30.
//

import Foundation
import Down

enum MarkdownElement {
    case heading(level: Int, text: String)
    case paragraph(String)
}

func parseMarkdown(_ input: String) -> [MarkdownElement] {
    let lines = input.split(separator: "\n", omittingEmptySubsequences: false)
    var elements: [MarkdownElement] = []
    var paragraphBuffer: [String] = []
    
    func flushParagraphBuffer() {
        if !paragraphBuffer.isEmpty {
            let combined = paragraphBuffer.joined(separator: " ")
            elements.append(.paragraph(combined))
            paragraphBuffer.removeAll()
        }
    }
    
    for line in lines {
        let trimmed = line.trimmingCharacters(in: .whitespaces)
        
        if trimmed.isEmpty {
            flushParagraphBuffer()
            continue
        }
        
        if line.hasPrefix("#") {
            // flush paragraphs so we dont fucking explode!!!
            flushParagraphBuffer()
            
            let rawLevel = line.prefix(while: { $0 == "#" }).count
            let level = min(rawLevel, 6)
            let text = line.drop(while: { $0 == "#" }).trimmingCharacters(in: .whitespaces)
            elements.append(.heading(level: level, text: text))
        } else {
            paragraphBuffer.append(trimmed)
        }
    }
    return elements
}

func renderHTML(from markdown: String) -> String {
    do {
        return try Down(markdownString: markdown).toHTML()
    } catch {
        return "<p><strong>Render error:</strong> \(error.localizedDescription)</p>"
    }
}

