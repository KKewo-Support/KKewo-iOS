//
//  MainView.swift
//  KKewo-iOS
//
//  Created by 이승진 on 5/12/25.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @State private var showRingView = false
    
  var body: some View {
    VStack(spacing: 21) {
      headerView
      
      /// 중단 리스트 뷰
        AlarmListView()
    }
    .navigationBarBackButtonHidden()
    .padding(EdgeInsets(top: 19, leading: 16, bottom: 0, trailing: 16))
    .sheet(isPresented: $showRingView) {
        RingView()
    }
    .onReceive(NotificationCenter.default.publisher(for: .didReceiveAlarmTrigger)) { _ in
        showRingView = true
    }
  }
  
  /// 상단 헤더 뷰 (로고 + 알람 생성 버튼)
  private var headerView: some View {
    HStack {
        Text("알람")
            .font(.pretendard(type: .bold, size: 28))
            .foregroundStyle(.black)
      
      Spacer()
      
      NavigationLink {
        AlarmSetupView()
      } label: {
        Image(systemName: "plus")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 20, height: 20)
          .foregroundStyle(.orange01)
      }
    }
    .padding(.horizontal, 20)
  }
}

#Preview {
  MainView()
}
