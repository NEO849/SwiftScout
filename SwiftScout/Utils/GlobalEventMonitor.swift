//
//  GlobalEventMonitor.swift
//  SwiftScout
//
//  Created by Michael Fleps on 10.04.25.
//

import Cocoa

/// Überwacht globale Tastenkombinationen, Funktioniert nur im Vordergrund, oder mit  Accessibility-Rechten.
class GlobalEventMonitor {
    
    /// Closure, die bei Erkennung ausgelöst wird
    private let handler: () -> Void
    private var monitor: Any?
    
    init(handler: @escaping () -> Void) {
        self.handler = handler
    }
    
    /// Aktiviert den globalen Event-Monitor (Doppelte Registrierung verhindern)
    func start() {
        stop()
        monitor = NSEvent.addGlobalMonitorForEvents(matching: [.leftMouseDown]) { [weak self] event in
            
            // Modifier Keys prüfen: Shift + Command
            let flags = event.modifierFlags
            let isShift = flags.contains(.shift)
            let isCommand = flags.contains(.command)
            
            if isShift && isCommand {
                print("✅ Shift + Command + Klick erkannt")
                self?.handler()
            }
        }
    }
    
    func stop() {
        if let monitor = monitor {
            NSEvent.removeMonitor(monitor)
            self.monitor = nil
        }
    }
    deinit {
        stop()
    }
}
