//
//  FYGridView.swift
//  WhatsNewSwiftUI
//
//  Created by FanYu on 2022/6/9.
//

import SwiftUI

struct FYGridView: View {
    var body: some View {
        Grid(alignment: .leading) {
            GridRow {
                Text("Red")
            }
            
            Divider()
            
            GridRow {
                Text("Bottom")
                    .background(.blue)
                    .gridCellColumns(2)
                    .gridColumnAlignment(.trailing)
            }
        }
    }
}

struct FYGridView_Previews: PreviewProvider {
    static var previews: some View {
        FYGridView()
    }
}
