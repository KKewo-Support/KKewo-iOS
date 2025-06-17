//
//  CustomBorderButton.swift
//  KKewo-iOS
//
//  Created by 여성일 on 5/13/25.
//

import SwiftUI

struct CustomBorderButton: View {
  let action: () -> Void
  let title: String
  let titleColor: Color
  let backgroundColor: Color
  
  init(
    action: @escaping () -> Void,
    title: String,
    titleColor: Color = .white,
    backgroundColor: Color = .orange01
  ) {
    self.action = action
    self.title = title
    self.titleColor = titleColor
    self.backgroundColor = backgroundColor
  }
  
  var body: some View {
    Button(action: action) {
      Text(title)
        .foregroundStyle(titleColor)
        .font(.pretendard(type: .semibold, size: 18))
        .frame(maxWidth: .infinity, minHeight: 56)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
  }
}

#Preview {
  CustomBorderButton(action: {}, title: "완료")
}
