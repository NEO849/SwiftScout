//
//  FloatingPanelView.swift
//  SwiftScout
//
//  Created by Michael Fleps on 09.04.25.
//

import SwiftUI

/// Zeigt alle gefundenen Funktionsreferenzen als anklickbare Liste an.Bei Klick wird die Datei in Xcode geöffnet.
struct FloatingPanelView: View {
    
    @EnvironmentObject var panelViewModel: FloatingPanelViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Funktionsübersicht")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top)
                .padding(.horizontal)
            Divider()
                .padding(.horizontal)
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(panelViewModel.functions) { function in
                        FunctionRow(function: function) {
                            panelViewModel.openFile(function)
                        }
                    }
                }
            }
        }
    }
}

struct FunctionRow: View {
    let function: FunctionModel
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack {
                VStack(alignment: .leading) {
                    Text(function.functionName)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.blue)
                    Text(function.fileName)
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                }
                Spacer()
                Text("⤴︎")
                    .foregroundColor(.gray)
            }
            .padding(12)
            .background(Color(.windowBackgroundColor))
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 1)
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.vertical, 4)
        .padding(.horizontal)
    }
        
}

#Preview {
    let viewModel = FloatingPanelViewModel()
    ChooseProvider.useMockData = true
    viewModel.loadFunctions()
    return FloatingPanelView()
        .environmentObject(viewModel)
        .frame(width: 420, height: 350)
}
