//
//  OnboardingVoiceIntroView.swift
//  KKewo-iOS
//
//  Created by 여성일 on 5/22/25.
//

import SwiftUI

struct OnboardingVoiceIntroView: View {
    let onRecommendButtonTapped: () -> Void
    
    var body: some View {
        VStack {
            Text("멘토들의 목소리로 하루를 시작해볼까요?")
                .font(.pretendard(type: .semibold, size: 16))
                .foregroundStyle(.gray03)
            
            Rectangle()
                .padding(.top, 74)
            
            Spacer()
            
            CustomBorderButton(action: onRecommendButtonTapped, title: "알람벨 추천받기", titleColor: .white, backgroundColor: .orange01)
                .padding(.horizontal, 24)
        }
    }
}

#Preview {
    OnboardingVoiceIntroView(onRecommendButtonTapped: { })
}
