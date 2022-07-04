//
//  GaugeView.swift
//  WhatsNewSwiftUI
//
//  Created by FanYu on 2022/7/4.
//

import SwiftUI

struct GaugeView: View {
    @State private var current = 30.0
    @State private var minValue = 20.0
    @State private var maxValue = 50.0

    let graident = Gradient(colors: [.green, .yellow, .orange, .red])
    
    var body: some View {
        VStack {
            Gauge(value: current, in: minValue...maxValue) {
                HStack {
                    Text("Title")
                    Spacer()
                }
            } currentValueLabel: {
                Text("\(Int(current))")
                    .foregroundColor(.blue)
            } minimumValueLabel: {
                Text("\(Int(minValue))")
            } maximumValueLabel: {
                Text("\(Int(maxValue))")
            }
            .gaugeStyle(.accessoryCircular)
            .tint(graident)

            Gauge(value: current, in: minValue...maxValue) {
                HStack {
                    Text("Title")
                    Spacer()
                }
            } currentValueLabel: {
                Text("\(Int(current))")
            } minimumValueLabel: {
                Text("\(Int(minValue))")
            } maximumValueLabel: {
                Text("\(Int(maxValue))")
            }
            .gaugeStyle(.linearCapacity)
            .tint(graident)

            Gauge(value: current, in: minValue...maxValue) {
                HStack {
                    Text("Title")
                    Spacer()
                }
            }
            .gaugeStyle(.linearCapacity)
            .tint(graident)
        }
    }
}

struct GaugeView_Previews: PreviewProvider {
    static var previews: some View {
        GaugeView()
    }
}
