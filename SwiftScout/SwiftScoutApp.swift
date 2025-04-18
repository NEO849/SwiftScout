//
//  SwiftScoutApp.swift
//  SwiftScout
//
//  Created by Michael Fleps on 09.04.25.
//

import SwiftUI

@main
struct SwiftScoutApp: App {
    
    // Kein echtes UI nötig – Panel wird über GlobalMonitor geöffnet.
    @StateObject var viewModel = FloatingPanelViewModel()
    let monitor: GlobalEventMonitor
    
    init() {
        let vm = FloatingPanelViewModel()
        self._viewModel = StateObject(wrappedValue: vm)
        self.monitor = GlobalEventMonitor(viewModel: vm)
        self.monitor.startMonitoring() // Startet Klick-Erkennung
    }
    
    var body: some Scene {
        WindowGroup {
            EmptyView()
        }
    }
}
