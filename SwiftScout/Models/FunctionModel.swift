//
//  FunctionModel.swift
//  SwiftScout
//
//  Created by Michael Fleps on 09.04.25.
//

import Foundation

/// Repräsentiert eine gefundene Funktion im Projekt
struct FunctionModel: Identifiable {
    let id = UUID()
    let functionName: String
    let fileName: String
    let filePath: String
}
