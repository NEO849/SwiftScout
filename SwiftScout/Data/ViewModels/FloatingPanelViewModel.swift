//
//  FloatingPanelViewModel.swift.swift
//  SwiftScout
//
//  Created by Michael Fleps on 09.04.25.
//

import Foundation
import AppKit

/// Für das Floating Panel. Laden, Filtern und Öffnen von Funktionsreferenze  (Source of Truth).
class FloatingPanelViewModel: ObservableObject {
    
    @Published var isPanelVisible: Bool = false
    @Published var functions: [FunctionModel] = []
    @Published var selectedFunction: String = ""
    private let service = SourceKitService()
    
    init() {
        loadFunctions()
    }
    
    /// Lädt alle verfügbaren Funktionsdaten, aus echtem SourceKit, oder Mock-Daten.
    func loadFunctions() {
        let provider = ChooseProvider.getProvider()
        self.functions = provider.loadFunctions()
    }
    
    // Sucht nach Funktionsreferenzen im gesamten Projekt
    func searchFunction(named name: String) {
        self.selectedFunction = name
        self.functions = service.findReferences(for: name)
    }
    
    // Öffnet die ausgewählte Referenz in Xcode
    func openFile(_ functions: FunctionModel) {
        service.openFile(functions.filePath, atLine: functions.lineNumber)
    }
}
