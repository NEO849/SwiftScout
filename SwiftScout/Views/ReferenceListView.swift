//
//  ReferneceListView.swift
//  SwiftScout
//
//  Created by Michael Fleps on 06.05.25.
//

import SwiftUI
import Foundation
import Combine

// View, die die Liste der Funktionen anzeigt
struct FunctionListView: View {
    @StateObject var viewModel = ReferenceViewModel() // ViewModel als StateObject

    var body: some View {
        List(viewModel.reference) { reference in
            Button(action: {
                // Aktion beim Klicken auf eine Funktion
                navigateToFunction(lineNumber: reference.lineNumber)
            }) {
                Text(reference.name) // Anzeige des Funktionsnamens
            }
        }
        .frame(width: 300, height: 400) // Größe des Fensters
    }

    // Funktion zum Navigieren zur entsprechenden Zeile
    func navigateToFunction(lineNumber: Int) {
        // Hier implementierst du die Logik, um zur entsprechenden Zeile zu navigieren
        // Dies könnte z.B. durch AppleScript oder andere Mechanismen erfolgen
    }
}
