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
    private let provider: FunctionDataProvider
    
    init() {
        self.provider = ChooseProvider.useMockData ? MockFunctionProvider() : RealFunctionProvider(filePath: "")
        self.functions = []
    }
    
    func loadFunctions(for filePath: String) {
        if ChooseProvider.useMockData {
            // Verwendet Mock, oder Real-Provider
            let mockProvider = MockFunctionProvider()
            self.functions = mockProvider.loadFunctions()
        } else {
            let realProvider = RealFunctionProvider(filePath: filePath)
            self.functions = realProvider.loadFunctions()
        }
    }
    
    // Datei in Xcode öffnen und das Floating Panel ausblenden
    func openFile(_ function: FunctionModel) {
        let url = URL(fileURLWithPath: function.filePath)
        NSWorkspace.shared.open(url)
        self.isPanelVisible = false
    }
}

struct ChooseProvider {
    static var useMockData: Bool = true
}
