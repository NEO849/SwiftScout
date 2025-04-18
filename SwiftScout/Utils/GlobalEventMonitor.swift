//
//  GlobalEventMonitor.swift
//  SwiftScout
//
//  Created by Michael Fleps on 10.04.25.
//

import AppKit
import Cocoa

final class GlobalEventMonitor {
    
    private var monitor: Any?
    private let panelViewModel: FloatingPanelViewModel
    
    init(viewModel: FloatingPanelViewModel) {
        self.panelViewModel = viewModel
    }
    
    /// Startet globale Mausklick-Überwachung
    func startMonitoring() {
        monitor = NSEvent.addGlobalMonitorForEvents(matching: [.leftMouseDown]) { [weak self] event in
            guard let self = self else { return }
            
            // Tastenkombination prüfen
            if isShiftCommandClick(event){
                // Aktuellen Datei-Pfad ermitteln
                if let filePath = getActiveXcodeFilePath() {
                    
                    // Funktionen aus Datei laden (via SourceKitten)
                    panelViewModel.loadFunctions(for: filePath)
                    
                    // Panel anzeigen
                    FloatingPanelManager.shared.showPanel(with: panelViewModel)
                }
            }
        }
    }
    
    private func isShiftCommandClick(_ event: NSEvent) -> Bool {
        return event.modifierFlags.contains(.command) &&
               event.modifierFlags.contains(.shift)
    }
    
    func stopMonitoring() {
        if let monitor = monitor {
            NSEvent.removeMonitor(monitor)
            self.monitor = nil
        }
    }
}
