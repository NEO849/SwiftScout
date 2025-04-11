//
//  FunctionNavigator.swift
//  SwiftScout
//
//  Created by Michael Fleps on 11.04.25.
//

import Foundation
import AppKit

/// Für die Navigation innerhalb des Projekts zuständig. Öffnet eine Datei und springt zur angegebenen Zeile.
struct FunctionNavigator {

    /// - Parameter function: Das Modell der Funktion, das die Zielinformation enthält
    static func navigate(to function: FunctionModel) {
        let fileURL = URL(fileURLWithPath: function.filePath)
        let process = Process()
        process.launchPath = "/usr/bin/xed"
        process.arguments = ["--line", "\(function.lineNumber)", fileURL.path]
        do {
            try process.run() // Startet den externen Prozess
        } catch {
            print("❌ Fehler beim Öffnen der Datei: \(error)")
        }
    }
}
