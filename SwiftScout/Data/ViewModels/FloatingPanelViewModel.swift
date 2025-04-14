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
    @Published var searchTerm: String = ""
    private let service = SourceKitService()
    private let provider: FunctionDataProvider
    
    init() {
        self.provider = ChooseProvider.useMockData ? MockFunctionProvider() : RealFunctionProvider()
        self.loadFunctions(for: "")
    }
    
    func loadFunctions(for functionName: String = "") {
        self.functions = provider.loadFunctions() // Nutzt übergebenen Provider
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
