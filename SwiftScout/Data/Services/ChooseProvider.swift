//
//  ChooseProvider.swift
//  SwiftScout
//
//  Created by Michael Fleps on 09.04.25.
//

import Foundation

/// Entscheidet, ob Mock- oder echte Daten verwendet werden
struct ChooseProvider {
    
    static var useMockData: Bool = true // ← Hier umschalten
    
    /// Gibt den passenden Datenprovider zurück
    static func getProvider() -> FunctionDataProvider {
        if useMockData {
            return MockFunctionProvider()
        } else {
            return RealFunctionProvider()
        }
    }
}
