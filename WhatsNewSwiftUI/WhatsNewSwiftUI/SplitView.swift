//
//  SplitView.swift
//  WhatsNewSwiftUI
//
//  Created by FanYu on 2022/6/8.
//

import SwiftUI

struct Team: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var players: [String]
}

struct SplitView: View {
    
    @State private var teams = [
        Team(name: "A", players: ["a1", "a2"]),
        Team(name: "B", players: ["b1", "b2"]),
        Team(name: "C", players: ["c1", "c2"]),
    ]
    
    @State private var selectedTeam: Team?
    @State private var selectedPlayer: String?
    
    var body: some View {
        NavigationSplitView {
            List(teams, selection: $selectedTeam) { team in
                Text(team.name)
            }
        } content: {
            List(selectedTeam?.players ?? [], id: \.self, selection: $selectedPlayer, rowContent: Text.init)
        } detail: {
            Text(selectedPlayer ?? "No player")
        }
        //.navigationSplitViewStyle(.prominentDetail)
    }
    
}

struct SliptView2: View {
    
    var body: some View {
        NavigationSplitView {
            
        } detail: {
            NavigationStack {
                
            }
        }
    }
    
}

struct SplitView_Previews: PreviewProvider {
    static var previews: some View {
        SplitView()
    }
}
