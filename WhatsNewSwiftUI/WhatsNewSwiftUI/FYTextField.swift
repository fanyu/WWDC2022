//
//  FYTextField.swift
//  WhatsNewSwiftUI
//
//  Created by FanYu on 2022/6/11.
//

import SwiftUI

struct FYTextField: View {
    @State private var bio = ""
    var body: some View {
        // 自动变高的textfiled，设置行数后，达到时，停止增高
        TextField("Enter", text: $bio, axis: .vertical)
            .textFieldStyle(.roundedBorder)
            .lineLimit(...5)
            .padding()
    }
}

struct FYTextField_Previews: PreviewProvider {
    static var previews: some View {
        FYTextField()
    }
}
