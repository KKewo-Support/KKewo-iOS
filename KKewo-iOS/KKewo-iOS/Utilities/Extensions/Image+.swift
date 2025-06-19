//
//  Image+.swift
//  KKewo-iOS
//
//  Created by 여성일 on 6/19/25.
//

import SwiftUI

enum AssetImageString: String {
  case onboarding1
  case onboarding2
  case sound
  case pause
  case sampleResult
  case tail
  case tailShadow
  case soundRecommend
}

extension Image {
  /// `AssetImageString` 열거형을 사용하여 에셋 이미지에 쉽게 접근할 수 있도록 하는 이니셜라이저입니다.
  ///
  /// ```swift
  /// Image(asset: .sound)
  /// ```
  ///
  /// - Parameter asset: `AssetImageString` 타입의 이미지 에셋 열거값
  init(asset: AssetImageString) {
    self.init(asset.rawValue)
  }
}
