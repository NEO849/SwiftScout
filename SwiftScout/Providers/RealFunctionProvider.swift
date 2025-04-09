//
//  RealFunctionProvider.swift
//  SwiftScout
//
//  Created by Michael Fleps on 09.04.25.
//

import Foundation

/// Lädt echte Daten aus SourceKit-LSP 
struct RealFunctionProvider: FunctionDataProvider {
    
    func loadFunctions() -> [FunctionModel] {
        // ⚠️ Hier später SourceKit-LSP-Integration
        return []
    }
}
