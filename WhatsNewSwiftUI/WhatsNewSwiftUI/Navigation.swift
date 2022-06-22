//
//  NavigationStack.swift
//  WhatsNewSwiftUI
//
//  Created by FanYu on 2022/6/8.
//

import SwiftUI

struct Navigation: View {
    
    @State private var path = [1,3,6]
    @State private var presented = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            Button("Back To Root", action: popToRoot)
            
            NavigationLink(value: "HelloWorld") {
                Text("Tap Me")
            }
            
            List(1..<50) { i in
                NavigationLink(value: i) {
                    Label("Row \(i)", systemImage: "\(i).circle")
                }
            }
            .navigationDestination(for: Int.self) { i in
                Text("Detail \(i)")
            }
            .navigationDestination(for: String.self) { s in
                Text("String \(s)")
            }
            .navigationTitle("Navigation")
        }
    }
    
    func popToRoot() {
        path.removeAll()
    }
}

struct NavigationStack_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
