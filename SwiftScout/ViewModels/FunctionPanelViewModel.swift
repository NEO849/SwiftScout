//
//  FunctionPanelViewModel.swift
//  SwiftScout
//
//  Created by Michael Fleps on 09.04.25.
//

import Foundation
import Combine

/// Für das Floating Panel. Verarbeitet die Logik, z. B. Daten laden, Filter anwenden, Navigation durchführen.
class FunctionPanelViewModel: ObservableObject {
    
    @Published var functions: [FunctionModel] = []
    @Published var searchTerm: String = ""

    /// Funktion wird später mit den echten SourceKit-Daten befüllt
    func loadMockData() {
        // Statische Daten zum Testen der UI
        self.functions = [
            FunctionModel(functionName: "fetchData", fileName: "DataService.swift", filePath: URL(fileURLWithPath: "/Pfad/zu/DataService.swift")),
            FunctionModel(functionName: "calculateScore", fileName: "ScoreViewModel.swift", filePath: URL(fileURLWithPath: "/Pfad/zu/ScoreViewModel.swift")),
            FunctionModel(functionName: "loginUser", fileName: "AuthService.swift", filePath: URL(fileURLWithPath: "/Pfad/zu/AuthService.swift"))
        ]
    }
}
