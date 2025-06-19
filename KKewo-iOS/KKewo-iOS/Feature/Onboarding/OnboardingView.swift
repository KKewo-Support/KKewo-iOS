//
//  OnboardingView.swift
//  KKewo-iOS
//
//  Created by 여성일 on 5/22/25.
//

import SwiftUI

struct OnboardingView: View {
  @State private var currentPage: Int = 0
  @State private var isNext: Bool = false
  
  private let totalPage = 2
  
  var body: some View {
    VStack {
      HStack(spacing: 6) {
        ForEach(0..<totalPage, id: \.self) { index in
          Circle()
            .frame(width: currentPage == index ? 12 : 10,
                   height: currentPage == index ? 12 : 10)
            .foregroundStyle(currentPage == index ? .orange01 : .gray01)
            .animation(.easeInOut(duration: 0.3), value: currentPage)
        }
      }
      
      VStack(spacing: 0) {
        Text("혼자 일어나기 힘든 러너들,")
          .font(.pretendard(type: .bold, size: 20))
          .foregroundStyle(.gray05)
        
        Text("멘토들이 깨워드릴게요!")
          .font(.pretendard(type: .bold, size: 28))
          .foregroundStyle(.gray05)
      }
      .padding(.top, 32)
      
      TabView(selection: $currentPage) {
        OnboardingAlarmIntroView()
          .tag(0)
        
        OnboardingVoiceIntroView(isNext: $isNext)
          .tag(1)
      }
      
      .padding(.top, 31)
      .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
    .navigationDestination(isPresented: $isNext, destination: {
      RecommendSoundView()
    })
    .padding(.vertical, 24)
  }
}

private extension OnboardingView {
  func handleNextAction() {
    withAnimation(.easeInOut) {
      currentPage = 1
    }
  }
}

#Preview {
  OnboardingView()
}

