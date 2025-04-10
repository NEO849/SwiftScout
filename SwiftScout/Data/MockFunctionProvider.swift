//
//  MockFunctionProvider.swift
//  SwiftScout
//
//  Created by Michael Fleps on 09.04.25.
//

import Foundation

// MARK: - Mockdaten Variable
struct MockSettings {
    static var useMockData: Bool = true 
}

// MARK: - Mock-Datenprovider
struct MockFunctionProvider: FunctionDataProvider {
    func loadFunctions() -> [FunctionModel] {
        guard MockSettings.useMockData else { return [] }
        return [
            FunctionModel(
                functionName: "fetchUserData()",
                fileName: "UserService.swift",
                filePath: "/Users/neo/XcodeProjects/SwiftScout/Services/UserService.swift"
            ),
            FunctionModel(
                functionName: "updateUI(with:)",
                fileName: "MainView.swift",
                filePath: "/Users/neo/XcodeProjects/SwiftScout/Views/MainView.swift"
            ),
            FunctionModel(
                functionName: "calculateSum(_:_:)",
                fileName: "MathUtils.swift",
                filePath: "/Users/neo/XcodeProjects/SwiftScout/Utils/MathUtils.swift"
            ),
            FunctionModel(
                functionName: "logError(_:)",
                fileName: "Logger.swift",
                filePath: "/Users/neo/XcodeProjects/SwiftScout/Core/Logger.swift"
            )
        ]
    }
}
