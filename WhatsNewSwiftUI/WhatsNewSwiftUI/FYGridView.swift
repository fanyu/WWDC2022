//
//  FYGridView.swift
//  WhatsNewSwiftUI
//
//  Created by FanYu on 2022/6/9.
//

import SwiftUI

struct FYGridView: View {
    var body: some View {
        Grid {
            GridRow {
                Text("Red")
            }
            
            Divider()
            
            GridRow {
                Text("Bottom")
                    .background(.blue)
                    .gridCellColumns(2)
            }
        }
    }
}

struct FYGridView_Previews: PreviewProvider {
    static var previews: some View {
        FYGridView()
    }
}
