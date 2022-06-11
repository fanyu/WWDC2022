//
//  FYShareLink.swift
//  WhatsNewSwiftUI
//
//  Created by FanYu on 2022/6/9.
//

import SwiftUI

struct FYShareLink: View {
    
    let link = URL(string: "he")!
    
    var body: some View {
        VStack {
            ShareLink(item: link)
            ShareLink("this is link", item: link)
            ShareLink(item: link, message: Text("somethings"))
            
            ShareLink(
                item: link,
                preview: SharePreview(
                    Text("A"),
                    image: Image(systemName: "swift")
                )
            )
        }
    }
}

struct FYShareLink_Previews: PreviewProvider {
    static var previews: some View {
        FYShareLink()
    }
}
