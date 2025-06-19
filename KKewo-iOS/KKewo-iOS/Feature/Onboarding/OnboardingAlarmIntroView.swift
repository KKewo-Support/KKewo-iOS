//
//  OnboardingAlarmIntroView.swift
//  KKewo-iOS
//
//  Created by 여성일 on 5/22/25.
//

import SwiftUI

struct OnboardingAlarmIntroView: View {
  var body: some View {
    VStack {
      Text("멘토들의 알람벨을 고를 수 있어요!")
        .font(.pretendard(type: .semibold, size: 16))
        .foregroundStyle(.gray03)
      
      Spacer()
      
      Image(asset: .onboarding1)
    }
  }
}

#Preview {
  OnboardingAlarmIntroView()
}
