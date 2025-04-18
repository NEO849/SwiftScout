//
//  RealFunctionProvider.swift
//  SwiftScout
//
//  Created by Michael Fleps on 10.04.25.
//

import Foundation

struct RealFunctionProvider: FunctionDataProvider {
    
    let filePath: String // Dynamisch übergebener Pfad
    
    func loadFunctions() -> [FunctionModel] {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/Users/neo/Documents/XCode-Apps/SwiftScout/SwiftScout.xcodeproj")
        task.arguments = ["structure", "--file", filePath]
        
        let pipe = Pipe()
        task.standardOutput = pipe
        
        do {
            try task.run() // Starte den Prozess
        } catch {
            print("Fehler beim Starten von SourceKitten: \(error)")
            return []
        }
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        
        // Nutzt den gemeinsamen Parser
        let rawSymbols = parseSymbols(from: data)
        
        // Filtert nur Methoden oder freie Funktionen heraus
        let relevantSymbols = rawSymbols.filter {
            $0.kind.contains("function.method") || $0.kind.contains("function.free")
        }
        
        // Wandelt sie in FunctionModel um
        let functionModels: [FunctionModel] = relevantSymbols.compactMap { symbol in
            guard let offset = symbol.offset,
                  let path = symbol.filePath else { return nil }
            return FunctionModel(name: symbol.name, path: path, offset: offset)
        }
        return functionModels
    }
    
    /// Sucht in Symbolen die Funktion zur Cursorposition
    func findSymbolAt(cursorLine: Int, symbols: [RawSymbol]) -> RawSymbol? {
        return symbols.first { symbol in
            guard let offset = symbol.offset else { return false }
            return cursorLine == offset
        }
    }
}
