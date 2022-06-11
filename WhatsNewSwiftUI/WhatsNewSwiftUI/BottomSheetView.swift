//
//  BottomSheetView.swift
//  WhatsNewSwiftUI
//
//  Created by FanYu on 2022/6/8.
//

import SwiftUI

struct BottomSheetView: View {
    @State private var showing = false
    
    var body: some View {
        Button("Show") {
            showing.toggle()
        }
        .sheet(isPresented: $showing) {
            Text("This is the sheet")
                .presentationDetents([.medium, .large])
                //.presentationDetents([.height(200)])
                //.presentationDetents([.fraction(0.5)])
                .presentationDragIndicator(.hidden)
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView()
    }
}
