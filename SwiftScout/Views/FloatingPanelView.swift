//
//  FloatingPanelView.swift
//  SwiftScout
//
//  Created by Michael Fleps on 09.04.25.
//

import SwiftUI

struct FloatingPanelView: View {
    
    @Binding var isVisible: Bool
    
    @ObservedObject var viewModel: FunctionPanelViewModel
     
     var body: some View {
         VStack(alignment: .leading, spacing: 8) {
             
             Text("Funktionsübersicht")
                 .font(.headline)
                 .padding(.top)
             
             ScrollView {
                 LazyVStack(alignment: .leading, spacing: 12) {
                     ForEach(viewModel.functions) { function in
                         Button(action: {
                             // Hier später: Navigation zur Datei
                             openFile(function.filePath)
                         }) {
                             HStack {
                                 Text(function.functionName)
                                     .font(.system(size: 14, weight: .bold))
                                     .foregroundColor(.blue)
                                 
                                 Spacer()
                                 
                                 Text(function.fileName)
                                     .font(.system(size: 12))
                                     .foregroundColor(.secondary)
                             }
                         }
                         .buttonStyle(PlainButtonStyle())
                     }
                 }
             }
             .frame(maxHeight: 300)
             .padding()
         }
         .padding()
         .frame(width: 400)
         .background(Color(NSColor.windowBackgroundColor))
         .cornerRadius(12)
         .shadow(radius: 20)
     }
     
     /// Öffnen einer Datei im Finder (ersetzt später durch Xcode-Integration)
     func openFile(_ path: URL) {
         NSWorkspace.shared.open(path)
     }
 }

#Preview {
    let viewModel = FunctionPanelViewModel()
     ChooseProvider.useMockData = true
     viewModel.loadFunctions()
     
     return FloatingPanelView(
         isVisible: .constant(true),
         viewModel: viewModel
     )
     .frame(width: 400, height: 400)
 }
