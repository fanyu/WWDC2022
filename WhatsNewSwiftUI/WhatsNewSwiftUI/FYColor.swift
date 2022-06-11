//
//  FYColor.swift
//  WhatsNewSwiftUI
//
//  Created by FanYu on 2022/6/11.
//

import SwiftUI

struct FYColor: View {
    
    let colors: [Color] = [.blue, .mint, .green, .yellow, .orange, .red]
    
    var body: some View {
        VStack {
            ForEach(colors, id: \.self) { color in
                Rectangle()
                    .fill(color.gradient)
            }
            Circle()
                .fill(.red.gradient.shadow(.drop(color: .black, radius: 20)))
        }
    }
}

struct FYColor_Previews: PreviewProvider {
    static var previews: some View {
        FYColor()
    }
}
