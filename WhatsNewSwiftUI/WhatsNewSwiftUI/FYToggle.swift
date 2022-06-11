//
//  FYToggle.swift
//  WhatsNewSwiftUI
//
//  Created by FanYu on 2022/6/11.
//

import SwiftUI

struct Email: Identifiable {
    let id: String
    var isGood: Bool
}

struct FYToggle: View {
    @State private var lists = [
        Email(id: "1", isGood: true),
        Email(id: "2", isGood: true),
        Email(id: "3", isGood: true)
    ]
    var body: some View {
        Form {
            Section {
                ForEach($lists) { $list in
                    Toggle(list.id, isOn: $list.isGood)
                }
            }
            Section {
                Toggle(isOn: $lists.map(\.isGood)) {
                    Text("All")
                }
            }
        }
    }
}

struct FYToggle_Previews: PreviewProvider {
    static var previews: some View {
        FYToggle()
    }
}
