//
//  SwiftScoutApp.swift
//  SwiftScout
//
//  Created by Michael Fleps on 09.04.25.
//

import SwiftUI

@main
struct SwiftScoutApp: App {
    @State private var isPanelVisible: Bool = true
    
    var body: some Scene {
        WindowGroup {
            FloatingPanelView(
                isVisible: $isPanelVisible, 
                viewModel: {
                    let vm = FunctionPanelViewModel()
                    vm.loadFunctions()
                    return vm
                }()
            )
        }
    }
}

#Preview {
    let viewModel = FunctionPanelViewModel()
    viewModel.loadFunctions()
    let isVisible = Binding<Bool>(
        get: { true },
        set: { _ in } // Ignorieren
    )
    return FloatingPanelView(isVisible: isVisible, viewModel: viewModel)
        .frame(width: 400, height: 400)
}
