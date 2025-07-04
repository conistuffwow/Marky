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
                EditorView()
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
                
                Button(action: {
                    insertMarkdownTag(">")
                }) {
                    Image(systemName: "text.quote")
                }
                Button(action: {
                    insertMarkdownTag("[text](url)")
                }) {
                    Image(systemName: "link")
                }
                Button(action: {
                    insertMarkdownTag("![alt](image.png)")
                }) {
                    Image(systemName: "photo")
                }
                Button(action: {
                    insertMarkdownTag("# ")
                }) {
                    Image(systemName: "number")
                }
                Button(action: {
                    insertMarkdownTag("- ")
                }) {
                    Image(systemName: "list.bullet")
                }
                Button(action: {
                    insertMarkdownTag("- [ ] ")
                }) {
                    Image(systemName: "checkmark.square")
                }
            }
            
        }
<<<<<<< HEAD
        
        
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
=======
>>>>>>> parent of a9a2832 (MD saving and loading)
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
