//
//  FYRequestReview.swift
//  WhatsNewSwiftUI
//
//  Created by FanYu on 2022/6/11.
//

import SwiftUI
import StoreKit

struct FYRequestReview: View {
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        Button("Review teh app") {
            requestReview()
        }
    }
}

struct FYRequestReview_Previews: PreviewProvider {
    static var previews: some View {
        FYRequestReview()
    }
}
