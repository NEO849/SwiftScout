//
//  ReferenceViewModel.swift
//  SwiftScout
//
//  Created by Michael Fleps on 06.05.25.
//

import Foundation

// ViewModel für die Liste der Funktionen
class ReferenceViewModel: ObservableObject {
    @Published var references: [Reference] = [] // Liste der Funktionen

    init() {
        loadMockData() // Lädt Mock-Daten zum Testen
    }

    // Lädt Beispiel-Daten
    func loadMockData() {
        references = [
            Reference(
                name: "calculateSum",
                lineNumber: 10,
                filePath: "https://example.com/code/main.swift"),
            Reference(
                name: "fetchData",
                lineNumber: 25,
                filePath: "https://example.com/code/main.swift"),
            Reference(
                name: "updateUI",
                lineNumber: 40,
                filePath: "https://example.com/code/main.swift"),
        ]
    }
}
