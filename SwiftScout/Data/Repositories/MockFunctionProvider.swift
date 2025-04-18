//
//  MockFunctionProvider.swift
//  SwiftScout
//
//  Created by Michael Fleps on 09.04.25.
//

import Foundation

// MARK: - Mock-Daten
struct MockFunctionProvider: FunctionDataProvider {
    func loadFunctions() -> [FunctionModel] {
        return [
            FunctionModel(
                name: "useColors()",
                path: "/Users/neo/XcodeProjects/SwiftScout/Services/UserService.swift",
                offset: 10),
            FunctionModel(
                name: "updateUI()",
                path: "/Users/neo/XcodeProjects/SwiftScout/Views/ImageView.swift",
                offset: 45),
            FunctionModel(
                name: "calculatePosition()",
                path: "/Users/neo/XcodeProjects/SwiftScout/Utils/PositionUtils.swift",
                offset: 123),
            FunctionModel(
                name: "logMessage()",
                path: "/Users/neo/XcodeProjects/SwiftScout/Core/Logger.swift",
                offset: 369)
        ]
    }
}
