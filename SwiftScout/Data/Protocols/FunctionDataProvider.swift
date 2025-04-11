//
//  FunctionDataProvider.swift
//  SwiftScout
//
//  Created by Michael Fleps on 09.04.25.
//

import Foundation

/// Jeder Datenprovider (Mock/Echt) MUSS diese Methode implementieren.
protocol FunctionDataProvider {
    func loadFunctions() -> [FunctionModel]
}
