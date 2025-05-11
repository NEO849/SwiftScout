//
//  Reference.swift
//  SwiftScout
//
//  Created by Michael Fleps on 05.05.25.
//

import Foundation

/// Repräsentiert eine Funktionsreferenz mit Name, Dateipfad und Zeilennummer
struct Reference: Identifiable {
    let id = UUID()
    let name: String
    let lineNumber: Int
    let filePath: String
}
