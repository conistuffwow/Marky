//
//  MainMarky.swift
//  Marky
//
//  Created by Coni on 2025-06-30.
//

import Foundation
import SwiftUI

struct MarkyView: View {

    @State private var defaultText: String = "# Untitled"
    @State private var showPreview: Bool = false
    
    @State private var headings: [Heading] = []
    @State private var selectedHeading: Heading?
    
    @Binding var isSaving: Bool
    @Binding var isLoading: Bool
    @State private var saveURL: URL? = nil
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(headings) { heading in
                    Button(action: {
                        scrollToHeading(heading)
                    }) {
                        Image(systemName: "number")
                            .foregroundColor(.accentColor)
                            .imageScale(.small)
                            .padding(.leading, CGFloat((heading.level - 1) * 10))
                        Text(heading.text)
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.primary)
                            .padding(.leading, CGFloat((heading.level - 1) * 12))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 200)
            .navigationTitle("Outline")
            .onChange(of: selectedHeading) { newSelection in
                if let heading = newSelection {
                    scrollToHeading(heading)
                }
            }
            
        } content: {
            if showPreview {
                PreviewView(markdownText: defaultText)
            } else {
                TextEditor(text: $defaultText)
                    .font(.system(.body, design: .monospaced))
                    .padding(8)
                    .background(Color(NSColor.textBackgroundColor))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onChange(of: defaultText) { newValue in
                        headings = extractHeadings(from: newValue)
                        if !headings.contains(where: {$0.id == selectedHeading?.id }) {
                            selectedHeading = nil
                        }
                    }
                    .onAppear {
                        headings = extractHeadings(from: defaultText)
                    }
            }
        } detail: {
            PreviewView(markdownText: defaultText)
        }
        .navigationTitle("untitled.md")
        .toolbar {
            ToolbarItemGroup {
                Spacer()
                Button(action: {
                    insertMarkdownTag("****")
                }) {
                    Image(systemName: "bold")
                }
                Button(action: {
                    insertMarkdownTag("**")
                }) {
                    Image(systemName: "italic")
                }
                Button(action: {
                    insertMarkdownTag("``")
                }) {
                    Image(systemName: "chevron.left.slash.chevron.right")
                }
            }
            
        }
        
        .fileImporter(isPresented: $isLoading, allowedContentTypes: [.markdown], allowsMultipleSelection: false) { result in
            do {
                guard let selectedFile = try result.get().first else { return }
                let loaded = try String(contentsOf: selectedFile)
                defaultText = loaded
            } catch {
                print("Failed to load file.")
            }
        }
        
        .fileExporter(isPresented: $isSaving, document: MarkdownDocument(text: defaultText), contentType: .markdown, defaultFilename: "untitled") { result in
            switch result {
            case .success(let url):
                saveURL = url
            case .failure(let error):
                print("Failed to save.")
            }
            
        }
    }
    
    func togglePreview() {
        showPreview.toggle()
    }
    
    func saveDoc() {
        // todo
    }
    
    func insertMarkdownTag(_ tag: String) {
        // inserts a tag
        defaultText += tag
    }
    
    func scrollToHeading(_ heading: Heading) {
        //todo
    }
}
