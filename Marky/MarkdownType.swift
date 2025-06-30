//
//  MarkdownType.swift
//  Marky
//
//  Created by Coni on 2025-06-30.
//

import Foundation
import UniformTypeIdentifiers

extension UTType {
    static var markdown: UTType {
        UTType(exportedAs: "net.daringfireball.markdown", conformingTo: .plainText)
    }
}
