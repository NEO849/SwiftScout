//
//  SwiftScoutApp.swift
//  SwiftScout
//
//  Created by Michael Fleps on 09.04.25.
//

import SwiftUI

@main
struct SwiftScoutApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
           EmptyView()
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
