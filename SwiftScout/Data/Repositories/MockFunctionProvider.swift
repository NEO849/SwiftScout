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
                functionName: "useColors()",
                fileName: "UserService.swift",
                filePath: "/Users/neo/XcodeProjects/SwiftScout/Services/UserService.swift",
                lineNumber: 10,
            ),
            FunctionModel(
                functionName: "useColors()",
                fileName: "ImageView.swift",
                filePath: "/Users/neo/XcodeProjects/SwiftScout/Views/ImageView.swift",
                lineNumber: 45,
            ),
            FunctionModel(
                functionName: "useColors()",
                fileName: "PositionUtils.swift",
                filePath: "/Users/neo/XcodeProjects/SwiftScout/Utils/PositionUtils.swift",
                lineNumber: 123,
            ),
            FunctionModel(
                functionName: "useColors()",
                fileName: "Logger.swift",
                filePath: "/Users/neo/XcodeProjects/SwiftScout/Core/Logger.swift",
                lineNumber: 369,
            )
        ]
    }
}
