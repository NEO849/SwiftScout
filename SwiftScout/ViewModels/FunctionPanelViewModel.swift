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
    
    func loadFunctions() {
         let provider = ChooseProvider.getProvider()
         self.functions = provider.loadFunctions()
     }
     
     func openFile(_ function: FunctionModel) {
         print("Datei der gesuchten Funktion geöffnet: \(function.functionName)")
         let url = URL(fileURLWithPath: function.filePath)
         NSWorkspace.shared.open(url)
     }
 }
