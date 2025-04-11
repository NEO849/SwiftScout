//
//  AppDelegate.swift
//  SwiftScout
//
//  Created by Michael Fleps on 09.04.25.
//

import Cocoa

/// Verwaltet wichtige Ereignisse im Lebenszyklus der Anwendung
class AppDelegate: NSObject, NSApplicationDelegate {
    
    /// Optionale Instanz, der globale Mausereignisse überwacht
    var eventMonitor: GlobalEventMonitor?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        eventMonitor = GlobalEventMonitor {
            // später: Panel öffnen
        }
        if let monitor = eventMonitor {
            monitor.start()
        }
    }
    
    /// Wird aufgerufen, kurz bevor die Anwendung beendet wird. Stoppt die Überwachung globaler Ereignisse, um Ressourcen freizugeben.
    func applicationWillTerminate(_ notification: Notification) {
        if let monitor = eventMonitor {
            monitor.stop()
        }
    }
}
