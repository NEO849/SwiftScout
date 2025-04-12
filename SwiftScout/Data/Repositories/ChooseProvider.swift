//
//  ChooseProvider.swift
//  SwiftScout
//
//  Created by Michael Fleps on 09.04.25.
//

import Foundation

/// Entscheidet, ob Mock- oder echte Daten verwendet werden und gibt passenden Provider zurück.
struct ChooseProvider {
    
    static var useMockData: Bool = true
    static func getProvider() -> FunctionDataProvider {
        useMockData ? MockFunctionProvider() : RealFunctionProvider()
    }
}
