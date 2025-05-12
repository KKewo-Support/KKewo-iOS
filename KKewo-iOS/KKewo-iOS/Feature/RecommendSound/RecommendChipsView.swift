//
//  RecommendChipsView.swift
//  KKewo-iOS
//
//  Created by 여성일 on 5/11/25.
//

import SwiftUI

struct RecommendChipsView: View {
    @Binding var selectedChips: Set<String>
    
    let chips: [String]
    let spacing: CGFloat = 8

    var body: some View {
        GeometryReader { geo in
            let totalTextCount = chips.map { $0.count }.reduce(0, +)
            let totalSpacing = spacing * CGFloat(chips.count - 1)
            let availableWidth = geo.size.width - totalSpacing

            HStack(spacing: spacing) {
                ForEach(chips, id: \.self) { chip in
                    let weight = CGFloat(chip.count) / CGFloat(totalTextCount)
                    let chipWidth = availableWidth * weight

                    RecommendCategoryButton(
                        action: {
                            onChipSelected(chip: chip)
                        },
                        title: chip,
                        isSelected: selectedChips.contains(chip),
                        fixedWidth: chipWidth,
                        fixedHeight: 64
                    )
                }
            }
        }
    }
}

private extension RecommendChipsView {
    func onChipSelected(chip: String) {
        if selectedChips.contains(chip) {
            selectedChips.remove(chip)
        } else {
            selectedChips.insert(chip)
        }
    }
}
