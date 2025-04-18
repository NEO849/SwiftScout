//
//  FloatingPanelManager.swift
//  SwiftScout
//
//  Created by Michael Fleps on 11.04.25.
//

import AppKit
import SwiftUI

/// Manager zur Anzeige des FloatingPanels als NSWindow
final class FloatingPanelManager {
    
    // Singleton zur globalen Nutzung
    static let shared = FloatingPanelManager()
    private var window: NSWindow?
    
    func showPanel(with viewModel: FloatingPanelViewModel) {
        let panelSize = NSSize(width: 420, height: 350)
        
        // Hauptbildschirm holen und Position berechnen
        guard let screen = NSScreen.main else { return }
        let screenFrame = screen.visibleFrame
        let panelX = screenFrame.maxX - panelSize.width - 50 // Abstand Rechts
        let panelY = screenFrame.maxY - panelSize.height - 100 // Abstand Oben
        let origin = CGPoint(x: panelX, y: panelY)
        
        // Der View wird mit dem ViewModel versehen, damit er dynamische Daten verwenden kann.
        let contentView = FloatingPanelView()
            .environmentObject(viewModel)
        
        // NSWindow mit HostingView einbetten
        let panelWindow = NSWindow(
            contentRect: NSRect(origin: origin, size: panelSize),
            styleMask: [.titled, .nonactivatingPanel],
            backing: .buffered,
            defer: false
        )
        panelWindow.isReleasedWhenClosed = false
        panelWindow.level = .floating
        panelWindow.contentView = NSHostingView(rootView: contentView)
        panelWindow.title = "Funktionen"
        panelWindow.makeKeyAndOrderFront(nil)
        panelWindow.makeMain()
        // Speichern der Instanz
        self.window = panelWindow
    }
    
    func hidePanel() {
        window?.close()
        window = nil
    }
}
