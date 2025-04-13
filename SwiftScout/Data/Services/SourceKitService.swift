//
//  SourceKitService.swift
//  SwiftScout
//
//  Created by Michael Fleps on 12.04.25.
//

import Foundation

/// Verwaltet den Zugriff auf SourceKitten und das Öffnen von Dateien in Xcode
final class SourceKitService {
    
    // Öffnet eine Datei in Xcode an einer bestimmten Zeile der Cursorposition
    func openFile(_ filePath: String, atLine line: Int) {
        let process = Process()
        // Neue Terminal-Prozessinstanz. Pfad zum Environment-Werkzeug, damit der "xed"-Befehl ausgeführt wird.
        process.launchPath = "/usr/bin/env"
        process.arguments = ["xed", "--line", "\(line)", filePath]
        do {
            try process.run()
        } catch {
            print("Fehler beim Öffnen der Datei in Xcode: \(error)")
        }
    }
    
    // Listet alle .swift-Dateien im Projektverzeichnis auf, nur reguläre Dateien
    private func allSwiftFiles(in directory: URL) -> [URL] {
        let fileManager = FileManager.default
        let keys: [URLResourceKey] = [.isRegularFileKey]
        var result: [URL] = []
        
        // Holt sich einen rekursiven Verzeichnis-Enumerator und Durchläuft jede Datei im Projektordner.
        guard let enumerator = fileManager.enumerator(at: directory, includingPropertiesForKeys: keys) else {
            return []
        }
        for case let fileURL as URL in enumerator {
            if fileURL.pathExtension == "swift" {
                result.append(fileURL)
            }
        }
        return result
    }
    
    /// Sucht mithilfe von "sourcekitten" nach allen Funktionsdefinitionen im Projekt, die mit dem Namen übereinstimmen.
    func findReferences(for functionName: String) -> [FunctionModel] {
        var references: [FunctionModel] = []
        // Aktuelles Projektverzeichnis als Startpunkt und speichert Liste aller .swift-Dateien im Projekt
        let projectRoot = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        let allFiles = allSwiftFiles(in: projectRoot)
        
        // Erstellt einen neuen Prozess zum Ausführen von sourcekitten für jede Datei
        for file in allFiles {
            let process = Process()
            process.launchPath = "/usr/bin/env"
            process.arguments = ["sourcekitten", "structure", "--file", file.path]
            
            // Terminal-Ergebnis wird in dieses Pipe-Objekt geleitet
            let pipe = Pipe()
            process.standardOutput = pipe
            do {
                try process.run()
            } catch {
                print("Fehler beim Start von sourcekitten: \(error)")
                continue
            }
            
            // Liest die Ausgabe von sourcekitten (das JSON-Format)
            let data = pipe.fileHandleForReading.readDataToEndOfFile()
            guard let output = String(data: data, encoding: .utf8),
                  let jsonData = output.data(using: .utf8),
                  let parsed = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any],
                  let substructure = parsed["key.substructure"] as? [[String: Any]] else {
                continue
            }
            
            // Jede func in der Datei durchgehen und suche nach der gewünschten func, wenn funcName passt, Referenzen Sammeln und zurückgeben.
            for element in substructure {
                if let functionName = element["key.name"] as? String,
                   functionName == functionName,
                   let line = element["key.line"] as? Int {
                    let fileName = URL(fileURLWithPath: file.path).lastPathComponent
                    let function = FunctionModel(functionName: functionName,
                                                 fileName: fileName,
                                                 filePath: file.path,
                                                 lineNumber: line
                    )
                    references.append(function)
                }
            }
        }
        return references
    }
}
