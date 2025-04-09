//
//  FunctionPanelViewModel.swift
//  SwiftScout
//
//  Created by Michael Fleps on 09.04.25.
//

import Foundation

/// Für das Floating Panel. Verarbeitet die Logik, z. B. Daten laden, Filter anwenden, Navigation durchführen.
class FunctionPanelViewModel: ObservableObject {
    
    @Published var functions: [FunctionModel] = []
    @Published var searchTerm: String = ""
    
    func loadFunctions() {
         let provider = ChooseProvider.getProvider()
         self.functions = provider.loadFunctions()
     }
     
     func openFunctionInXcode(_ function: FunctionModel) {
         // Später Xcode-Öffnen-Logik
         print("Öffne Funktion: \(function.functionName)")
     }
 }
