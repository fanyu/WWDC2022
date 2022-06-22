//
//  EqualWidthHStack.swift
//  WhatsNewSwiftUI
//
//  Created by FanYu on 2022/6/22.
//

import Foundation
import SwiftUI

struct EqualWidthView: View {
    var body: some View {
        // 自动根据屏幕宽度，能否放下，来选择layout
        ViewThatFits {
            EqualWidthHStack {
                ForEach(1..<4) { id in
                    Button("id = \(id)") {
                        
                    }
                    .buttonStyle(.bordered)
                }
            }
            VStack {
                ForEach(1..<4) { id in
                    Button("id = \(id)") {
                        
                    }
                    .buttonStyle(.bordered)
                }

            }
        }
    }
}

struct EqualWidthView_Previews: PreviewProvider {
    static var previews: some View {
        EqualWidthView()
    }
}


struct EqualWidthHStack: Layout {
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        // Return a size.
        guard !subviews.isEmpty else { return .zero }

        let maxSize = maxSize(subviews: subviews)
        let spacing = spacing(subviews: subviews)
        let totalSpacing = spacing.reduce(0) { $0 + $1 }

        return CGSize(
            width: maxSize.width * CGFloat(subviews.count) + totalSpacing,
            height: maxSize.height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        // Place child views.
        guard !subviews.isEmpty else { return }
      
        let maxSize = maxSize(subviews: subviews)
        let spacing = spacing(subviews: subviews)

        let placementProposal = ProposedViewSize(width: maxSize.width, height: maxSize.height)
        var x = bounds.minX + maxSize.width / 2
      
        for index in subviews.indices {
            subviews[index].place(
                at: CGPoint(x: x, y: bounds.midY),
                anchor: .center,
                proposal: placementProposal)
            x += maxSize.width + spacing[index]
        }
    }

    private func maxSize(subviews: Subviews) -> CGSize {
        let subviewSizes = subviews.map { $0.sizeThatFits(.unspecified) }
        let maxSize: CGSize = subviewSizes.reduce(.zero) { currentMax, subviewSize in
            CGSize(
                width: max(currentMax.width, subviewSize.width),
                height: max(currentMax.height, subviewSize.height)
            )
        }
        
        return maxSize
    }
    
    private func spacing(subviews: Subviews) -> [CGFloat] {
        subviews.indices.map { index in
            guard index < subviews.count - 1 else { return 0 }
            return subviews[index].spacing.distance(to: subviews[index + 1].spacing, along: .horizontal)
        }
    }
    
}
