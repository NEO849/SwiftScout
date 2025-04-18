//
//  RawSymbol.swift
//  SwiftScout
//
//  Created by Michael Fleps on 18.04.25.
//

import Foundation

/// Repräsentiert einen JSON-Eintrag aus sourcekitten
struct RawSymbol: Codable {
    let kind: String
    let name: String
    let offset: Int?
    let filePath: String?

    enum CodingKeys: String, CodingKey {
        case kind = "key.kind"
        case name = "key.name"
        case offset = "key.offset"
        case filePath = "key.filepath"
    }
}

/// Wurzel-Objekt im JSON von sourcekitten (enthält "key.substructure")
struct SymbolRoot: Codable {
    let substructure: [RawSymbol]

    enum CodingKeys: String, CodingKey {
        case substructure = "key.substructure"
    }
}
