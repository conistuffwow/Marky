//
//  Heading.swift
//  Marky
//
//  Created by Coni on 2025-06-30.
//

import Foundation

struct Heading: Identifiable, Equatable {
    let id = UUID()
    let level: Int
    let text: String
    let range: Range<String.Index>
    
    static func == (lhs: Heading, rhs: Heading) -> Bool {
        lhs.id == rhs.id
    }
}

func extractHeadings(from markdown: String) -> [Heading] {
    var headings: [Heading] = []
    let lines = markdown.split(separator: "\n", omittingEmptySubsequences: false)
    var currentIndex = markdown.startIndex
    
    for line in lines {
        if let match = line.range(of: #"^(#{1,6})\s+(.*)$"#, options: .regularExpression) {
            let hashes = line[match].prefix { $0 == "#" }
            let level = hashes.count
            let textStart = line.index(match.lowerBound, offsetBy: level + 1)
            let text = line[textStart...].trimmingCharacters(in: .whitespaces)
            
            if let lineRange = markdown.range(of: String(line), range: currentIndex..<markdown.endIndex) {
                headings.append(Heading(level: level, text: text, range: lineRange))
            }
        }
        currentIndex = markdown.index(currentIndex, offsetBy: line.count + 1, limitedBy: markdown.endIndex) ?? markdown.endIndex
    }
    return headings
}
