//
//  FloatingPanelManager.swift
//  SwiftScout
//
//  Created by Michael Fleps on 11.04.25.
//


import AppKit
import SwiftUI

/// Manager zur Anzeige des FloatingPanels als NSWindow
class FloatingPanelManager {
    
    private var panelWindow: NSWindow?
    
    func showPanel(with viewModel: FunctionPanelViewModel) {
         let panelSize = NSSize(width: 420, height: 350)

         // Feste Position, Zentriert oben rechts
         guard let screen = NSScreen.main else { return }
         let screenFrame = screen.visibleFrame
         let panelX = screenFrame.maxX - panelSize.width - 50 // Abstand Rechts
         let panelY = screenFrame.maxY - panelSize.height - 100 // Abstand Oben
         let origin = CGPoint(x: panelX, y: panelY)

         // SwiftUI View einbetten
         let contentView = FloatingPanelView(isVisible: .constant(true), viewModel: viewModel)

         // Panel-Fenster erstellen
         let window = NSWindow(
             contentRect: NSRect(origin: origin, size: panelSize),
             styleMask: [.titled, .nonactivatingPanel],
             backing: .buffered,
             defer: false
         )
         window.isReleasedWhenClosed = false
         window.level = .floating
         window.contentView = NSHostingView(rootView: contentView)
         window.title = "Funktionen"
         window.makeKeyAndOrderFront(nil)
         window.makeMain()
         self.panelWindow = window
     }
    
    /// Schliesst das Panel
    func hidePanel() {
        panelWindow?.close()
        panelWindow = nil
    }
}
