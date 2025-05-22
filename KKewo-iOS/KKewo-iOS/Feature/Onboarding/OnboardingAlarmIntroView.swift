//
//  OnboardingAlarmIntroView.swift
//  KKewo-iOS
//
//  Created by 여성일 on 5/22/25.
//

import SwiftUI

struct OnboardingAlarmIntroView: View {
    let onNextButtonTapped: () -> Void
    
    var body: some View {
        VStack {
            Text("멘토들의 알람벨을 고를 수 있어요!")
                .font(.pretendard(type: .semibold, size: 16))
                .foregroundStyle(.gray03)
            
            Rectangle()
                .padding(.top, 74)
                .padding(.horizontal, 63)
            
            Spacer()
            
            CustomBorderButton(action: onNextButtonTapped,
                               title: "다음",
                               titleColor: .orange01,
                               backgroundColor: .orange00
            )
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    OnboardingAlarmIntroView(onNextButtonTapped: { })
}
