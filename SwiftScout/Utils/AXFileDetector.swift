//
//  AXFileDetector.swift
//  SwiftScout
//
//  Created by Michael Fleps on 18.04.25.
//

import Foundation
import Cocoa
import ApplicationServices

/// Ermittelt vollständigen Pfad. Wichtig: Die App benötigt Rechte für "Bedienungshilfen"
func getActiveXcodeFilePath() -> String? {
    // Holt die laufende Xcode-App über den Bundle-Identifier
    guard let xcodeApp = NSRunningApplication.runningApplications(withBundleIdentifier: "com.apple.dt.Xcode").first else {
        print("Xcode läuft nicht.")
        return nil
    }

    // Accessibility-Element für die App erzeugen, aktuell fokussiertes Fenster holen
    let appElement = AXUIElementCreateApplication(xcodeApp.processIdentifier)
    var focusedWindow: AnyObject?
    let result = AXUIElementCopyAttributeValue(appElement, kAXFocusedWindowAttribute as CFString, &focusedWindow)

    guard result == .success, let window = focusedWindow else {
        print("Kein aktives Fenster in Xcode gefunden.")
        return nil
    }

    // Aus dem Fenster den Dokumentpfad auslesen
    var documentPath: AnyObject?
    let resultPath = AXUIElementCopyAttributeValue(window as! AXUIElement, "AXDocument" as CFString, &documentPath)

    guard resultPath == .success, let path = documentPath as? String else {
        print("Konnte Dateipfad nicht ermitteln (AXDocument nicht verfügbar).")
        return nil
    }

    return path
}
