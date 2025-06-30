//
//  MarkdownEnv.swift
//  Marky
//
//  Created by Coni on 2025-06-30.
//

import Foundation
import SwiftUI

private struct MarkdownTextKey: EnvironmentKey {
    static let defaultValue: String = ""
}

extension EnvironmentValues {
    var markdownText: String {
        get { self[MarkdownTextKey.self] }
        set { self[MarkdownTextKey.self] = newValue }
    }
}
