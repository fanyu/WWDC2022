//
//  FYMultiDatePicker.swift
//  WhatsNewSwiftUI
//
//  Created by FanYu on 2022/6/9.
//

import SwiftUI

struct FYMultiDatePicker: View {
    
    @State private var dates = Set<DateComponents>()
    @Environment(\.calendar) var calendar
    
    var body: some View {
        VStack{
            MultiDatePicker("Pick Dates", selection: $dates)
            Text(summary)
        }
        .padding()
    }
    
    var summary: String {
        dates.compactMap { components in
            calendar.date(from: components)?.formatted(date: .long, time:.omitted)
        }.formatted()
    }
    
}

struct FYMultiDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        FYMultiDatePicker()
    }
}
