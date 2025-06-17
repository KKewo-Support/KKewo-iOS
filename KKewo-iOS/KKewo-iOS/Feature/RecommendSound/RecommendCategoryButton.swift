//
//  RecommendCategoryButton.swift
//  KKewo-iOS
//
//  Created by 여성일 on 5/11/25.
//

import SwiftUI

struct RecommendCategoryButton: View {
  let action: () -> Void
  let title: String
  let isSelected: Bool
  let fixedWidth: CGFloat
  let fixedHeight: CGFloat
  
  var body: some View {
    Button(action: action) {
      Text(title)
        .font(.pretendard(type: .semibold, size: 16))
        .foregroundStyle(isSelected ? .orange01 : .gray06)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    .frame(width: fixedWidth, height: fixedHeight)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(isSelected ? .orange00 : .white)
    )
    .overlay {
      RoundedRectangle(cornerRadius: 16)
        .stroke(isSelected ? .orange01 : .gray01)
    }
  }
}

#Preview {
  RecommendCategoryButton(action: {}, title: "test", isSelected: true, fixedWidth: 200, fixedHeight: 64)
}
