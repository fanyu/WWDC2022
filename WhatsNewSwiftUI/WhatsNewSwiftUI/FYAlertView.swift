//
//  FYAlertView.swift
//  WhatsNewSwiftUI
//
//  Created by FanYu on 2022/6/9.
//

import SwiftUI

struct FYAlertView: View {
    
    @State private var showAlert = false

    var body: some View {
        Button("Show Alert") {
            showAlert.toggle()
        }
        .alert("Hello world", isPresented: $showAlert) {
            TextField("Input name", text: .constant(""))
            Button("Cancel") {
                
            }
            Button("Confirm") {
                
            }
        }
    }
}

struct FYAlertView_Previews: PreviewProvider {
    static var previews: some View {
        FYAlertView()
    }
}
