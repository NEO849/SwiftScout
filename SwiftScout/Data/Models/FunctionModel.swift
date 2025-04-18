//
//  FunctionModel.swift
//  SwiftScout
//
//  Created by Michael Fleps on 09.04.25.
//

import Foundation

/// Repräsentiert eine gefundene Funktion im Projekt
struct FunctionModel: Identifiable {
    let id = UUID()
    let name: String
    let filePath: String
    let fileName: String
    let lineNumber: Int
    
    /// Eigener Initializer für dynamische Erstellung über RawSymbol
    init(name: String, path: String, offset: Int) {
        self.name = name
        self.filePath = path
        self.fileName = URL(fileURLWithPath: path).lastPathComponent
        self.lineNumber = offset
    }
}
