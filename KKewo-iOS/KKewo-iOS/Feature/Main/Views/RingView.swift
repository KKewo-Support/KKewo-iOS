//
//  RingView.swift
//  KKewo-iOS
//
//  Created by 이승진 on 6/30/25.
//

import SwiftUI
import SwiftData
import AVFoundation

/// 예시뷰
struct RingView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var viewModel = RingViewModel()
    
    var body: some View {
        VStack(spacing: 24) {
            Text("알람이 울리고 있어요!")
                .font(.title)
            
            CustomBorderButton(action: {
                viewModel.snooze()
                viewModel.stopAlarm()
                dismiss()
            }, title: "5분 후 다시 알림")
            
            CustomBorderButton(action: {
                viewModel.stopAlarm()
                dismiss()
            }, title: "종료")
        }
        .padding(.horizontal, 20)
        .onAppear {
            viewModel.startAlarm()
        }
    }
}

#Preview {
    RingView()
}
