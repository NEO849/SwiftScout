//
//  FunctionPanelViewModel.swift
//  SwiftScout
//
//  Created by Michael Fleps on 09.04.25.
//

import Foundation
import AppKit

/// Für das Floating Panel. Verarbeitet die Logik, z. B. Daten laden, Filter anwenden, Navigation durchführen.
class FunctionPanelViewModel: ObservableObject {
    
    @Published var functions: [FunctionModel] = []
    @Published var searchTerm: String = ""
    
    init() {
        loadFunctions()
    }
    
    func loadFunctions() {
         let provider = ChooseProvider.getProvider()
         self.functions = provider.loadFunctions()
     }
    
    /// Öffnet eine Datei über den Finder bzw. über das Standardprogramm
    /// Wird direkt von der UI aufgerufen (z. B. Tap auf eine Funktion)
    func openFile(_ function: FunctionModel) {
        print("🔍 Öffne Funktion: \(function.functionName)")
        FunctionNavigator.navigate(to: function) // Navigiert direkt zu Position
    }
}
     
