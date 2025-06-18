//
//  CustomNavigationBar.swift
//  KKewo-iOS
//
//  Created by 이승진 on 5/12/25.
//

import SwiftUI
import UIKit

struct CustomNavigationBar<RightContent: View>: View {
  let title: String
  let showBackButton: Bool
  let rightButtonContent: RightContent?
  let rightButtonAction: (() -> Void)?
  
  @Environment(\.dismiss) private var dismiss
  
  init(
    title: String,
    showBackButton: Bool = true,
    rightButtonContent: RightContent? = nil,
    rightButtonAction: (() -> Void)? = nil
  ) {
    self.title = title
    self.showBackButton = showBackButton
    self.rightButtonContent = rightButtonContent
    self.rightButtonAction = rightButtonAction
  }
  
  var body: some View {
    ZStack {
      // 타이틀
      Text(title)
        .font(.pretendard(type: .semibold, size: 18))
        .foregroundColor(.black)
        .frame(maxWidth: .infinity, alignment: .center)
      
      // 왼쪽 버튼
      HStack {
        if showBackButton {
          Button(action: { dismiss() }) {
            Image(systemName: "chevron.left")
              .font(.title2)
              .foregroundColor(.black)
              .frame(width: 24, height: 24)
          }
        } else {
          Spacer().frame(width: 24)
        }
        Spacer()
      }
      
      // 오른쪽 버튼
      HStack {
        Spacer()
        if let content = rightButtonContent,
           let action = rightButtonAction {
          Button(action: action) {
            content
              .foregroundColor(.orange01)
              .frame(height: 24)
          }
        } else {
          Spacer().frame(width: 24)
        }
      }
    }
    .padding(.horizontal)
    .padding(.bottom, 8)
  }
}

/// 뒤로가기 스와이프
extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
  open override func viewDidLoad() {
    super.viewDidLoad()
    interactivePopGestureRecognizer?.delegate = self
  }
  
  public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    return viewControllers.count > 1
  }
}


#Preview {
  CustomNavigationBar(
    title: "알람 맞추기",
    rightButtonContent: Text("완료")
      .font(.system(size: 18, weight: .regular))
      .foregroundStyle(.orange),
    rightButtonAction: { print("텍스트 버튼 클릭됨") }
  )
}
