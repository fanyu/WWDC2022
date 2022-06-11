//
//  FYSearhView.swift
//  WhatsNewSwiftUI
//
//  Created by FanYu on 2022/6/11.
//

import SwiftUI

struct Message: Identifiable, Codable {
    let id: Int
    var user: String
    var text: String
}

enum SearchScope: String, CaseIterable {
    case inbox, favorites
}

struct FYSearhView: View {
    
    @State private var messages = [Message]()
    @State private var searchText = ""
    @State private var searchScope = SearchScope.inbox
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredMessages) { message in
                    VStack(alignment: .leading) {
                        Text(message.user)
                            .font(.headline)
                        Text(message.text)
                    }
                }
            }
            // 自带scope，segment tab
            .searchable(text: $searchText, scope: $searchScope) {
                ForEach(SearchScope.allCases, id: \.rawValue) { scope in
                    Text(scope.rawValue.capitalized)
                }
            }
            .navigationTitle("Messages")
        }
        .onSubmit(of: .search, search)
        .onChange(of: searchScope) { _ in search() }
    }
    
    var filteredMessages: [Message] {
        if searchText.isEmpty {
            return messages
        } else {
            return messages.filter { $0.text.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    func search() {
        Task {
            guard let url = URL(string: "https://hws.dev/\(searchScope.rawValue).json") else {
                return
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            messages = try JSONDecoder().decode([Message].self, from: data)
        }
    }
}

struct FYSearhView_Previews: PreviewProvider {
    static var previews: some View {
        FYSearhView()
    }
}
