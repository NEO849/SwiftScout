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
    /// Verbindet den SwiftUI-Lebenszyklus mit dem App-Delegaten (ist kein View, sondern Teil der App-Lifecycle-Logik (Cocoa / UIKit))
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    /// Daher wird  eine  explizite Instanz übergeben.
    init() {
        appDelegate.panelViewModel = panelViewModel
    }
    
    var body: some Scene {
        WindowGroup {
           EmptyView()
        }
        .environmentObject(panelViewModel)
    }
}
