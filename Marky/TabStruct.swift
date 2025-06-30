//
//  TabStruct.swift
//  Marky
//
//  Created by Coni on 2025-06-30.
//

import Foundation

struct MarkdownTab: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var text: String
    var url: URL?
}
