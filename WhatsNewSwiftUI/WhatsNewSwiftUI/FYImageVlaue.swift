//
//  FYImageVlaue.swift
//  WhatsNewSwiftUI
//
//  Created by FanYu on 2022/6/11.
//

import SwiftUI

struct FYImageVlaue: View {
    @State private var value = 0.0
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "aqi.low", variableValue: value)
                Image(systemName: "wifi", variableValue: value)
                Image(systemName: "chart.bar.fill", variableValue: value)
                Image(systemName: "wavaeform", variableValue: value)
            }
            Slider(value: $value)
        }
        .font(.system(size: 70))
        .foregroundColor(.red)
        .padding()
    }
}

struct FYImageVlaue_Previews: PreviewProvider {
    static var previews: some View {
        FYImageVlaue()
    }
}
