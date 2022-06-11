//
//  FYTapLocation.swift
//  WhatsNewSwiftUI
//
//  Created by FanYu on 2022/6/9.
//

import SwiftUI

struct FYTapLocation: View {
    var body: some View {
        Circle()
            .fill(.red)
            .frame(width: 200, height: 200)
            .onTapGesture { location in
                print("Tapped at \(location)")
            }
            .onTapGesture(coordinateSpace: .global) { location in
                print("Tapped at \(location)")
            }
    }
}

struct FYTapLocation_Previews: PreviewProvider {
    static var previews: some View {
        FYTapLocation()
    }
}
