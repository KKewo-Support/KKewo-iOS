//
//  AlarmSetupView.swift
//  KKewo-iOS
//
//  Created by 이승진 on 5/12/25.
//

import SwiftUI

struct AlarmSetupView: View {
    @State private var time: Date = Date()
    @State private var title: String = "알람"
    @State private var selectedSound: String = "Leeo의 감미로운 아침"
    @State private var isRepeated: Bool = false
    @State private var isSnoozeEnabled: Bool = true
    
    var body: some View {
        VStack(spacing: 47) {
            CustomNavigationBar(
                title: "알람 맞추기",
                rightButtonContent: Text("완료")
                    .font(.system(size: 18, weight: .regular))
                    .foregroundStyle(.orange),
                rightButtonAction: { print("텍스트 버튼 클릭됨") }
            )
            
            VStack(spacing: 43){
                DatePickerView(time: $time)
                
                AlarmSettingView(
                    title: $title,
                    selectedSound: $selectedSound,
                    isRepeated: $isRepeated,
                    isSnoozeEnabled: $isSnoozeEnabled
                )
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        AlarmSetupView()
    }
}
