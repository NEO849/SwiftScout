//
//  RawSymbol.swift
//  SwiftScout
//
//  Created by Michael Fleps on 18.04.25.
//

import Foundation

/// Repräsentiert einen JSON-Eintrag wieder das von sourcekitten generiert wird.
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

/// Wurzel-Objekt des JSONs, das das Array `key.substructure` enthält.
struct SymbolRoot: Codable {
    let substructure: [RawSymbol]

    enum CodingKeys: String, CodingKey {
        case substructure = "key.substructure"
    }
}

/// JSON-Daten die von sourceKitten geliefert werden in ein SymbolRoot-Objekt Parsen.
func parseSymbols(from data: Data) -> [RawSymbol] {
    do {
        let decoder = JSONDecoder()
        let result = try decoder.decode(SymbolRoot.self, from: data)
        return result.substructure
    } catch {
        print("Fehler beim Parsen der Symboldaten: \(error)")
        return []
    }
}
