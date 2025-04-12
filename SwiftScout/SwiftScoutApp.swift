//
//  SwiftScoutApp.swift
//  SwiftScout
//
//  Created by Michael Fleps on 09.04.25.
//

import SwiftUI

@main
struct SwiftScoutApp: App {
    
    @StateObject private var panelViewModel = FloatingPanelViewModel()
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
           EmptyView()
        }
        .environmentObject(panelViewModel)
    }
}
