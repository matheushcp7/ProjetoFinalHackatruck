//
//  ContentView.swift
//  MonitoriasProjeto
//
//  Created by Turma02-22 on 26/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Agua()
                .tabItem {
                    Label("", systemImage: "drop.fill")
                }
            Home()
                .tabItem {
                    Label("", systemImage: "house.fill")
                }
            Monitorias()
                .tabItem { 
                    Label("", systemImage: "doc.richtext.fill.he")
                }
        }
    }
}

#Preview {
    ContentView()
}
