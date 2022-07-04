//
//  ShadowView.swift
//  WhatsNewSwiftUI
//
//  Created by FanYu on 2022/7/4.
//

import SwiftUI
import CoreMotion

class MotionManager: ObservableObject {
    
    @Published var x = 0.0
    @Published var y = 0.0
    
    private let motionManager = CMMotionManager()
    
    init() {
        motionManager.deviceMotionUpdateInterval = 1 / 15
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] data, error in
            guard let motion = data?.attitude else { return }
            self?.x = motion.roll
            self?.y = motion.pitch
        }
    }
    
}

struct ShadowView: View {
    
    @StateObject private var motion = MotionManager()
    
    var body: some View {
        VStack {
            Text("?")
            Image(systemName: "arrow.down.message.fill")
        }
        .foregroundStyle(
            .blue.gradient.shadow(
                .inner(color:.black, radius: 10, x: motion.x * 50, y: motion.y * 50)
            )
            .shadow(
                .drop(color: .black.opacity(0.2), radius: 10, x: motion.x * 50, y: motion.y * 50)
            )
        )
        .font(.system(size: 600).bold())
        .rotation3DEffect(.degrees(motion.x * 20), axis: (x: 0, y: 1, z: 0))
        .rotation3DEffect(.degrees(motion.y * 20), axis: (x: -1, y: 0, z: 0))
    }
    
}

struct ShadowView_Previews: PreviewProvider {
    static var previews: some View {
        ShadowView()
    }
}
