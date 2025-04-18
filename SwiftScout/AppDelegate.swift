//
//  AppDelegate.swift
//  SwiftScout
//
//  Created by Michael Fleps on 09.04.25.
//

//import Cocoa
//import SwiftUI
//
///// Verwaltet wichtige Ereignisse im Lebenszyklus der Anwendung
//class AppDelegate: NSObject, NSApplicationDelegate {
//    
//    var eventMonitor: GlobalEventMonitor?
//    var panelViewModel: FloatingPanelViewModel?
//    var windowManager = NsWindowManager()
//    
//    func applicationDidFinishLaunching(_ notification: Notification) {
//        // Entscheide hier, ob Mock-Daten verwendet werden sollen (z.B. aus einer Konfigurationsdatei)
//        ChooseProvider.useMockData = true
//
//        panelViewModel = FloatingPanelViewModel()
//        
//        // Globaler EventMonitor startet und bei Tastenkombi Panel anzeigt
//        eventMonitor = GlobalEventMonitor {
//            if let viewModel = self.panelViewModel {
//                self.windowManager.showPanel(with: viewModel)
//                viewModel.isPanelVisible = true // Flag im ViewModel setzen
//            }
//        }
//        eventMonitor?.start()
//    }
//    
//    func applicationWillTerminate(_ notification: Notification) {
//        eventMonitor?.stop()
//    }
//}
//
//struct ChooseProvider {
//    static var useMockData: Bool = false
//}
