//
//  AlarmSetupView.swift
//  KKewo-iOS
//
//  Created by 이승진 on 5/12/25.
//

import SwiftUI
import SwiftData

struct AlarmSetupView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Bindable var viewModel = AlarmSetupViewModel()

    var body: some View {
        VStack(spacing: 47) {
            CustomNavigationBar(
                title: "알람 맞추기",
                rightButtonContent: Text("완료")
                    .font(.system(size: 18, weight: .regular))
                    .foregroundStyle(.orange),
                rightButtonAction: {
                    viewModel.saveAlarm(context: context) {
                        dismiss()
                    }
                }
            )
            
            VStack(spacing: 43){
                DatePickerView(time: $viewModel.time)
                AlarmSettingView(
                    title: $viewModel.title,
                    selectedSound: $viewModel.selectedSound,
                    isRepeated: $viewModel.isRepeated,
                    isSnoozeEnabled: $viewModel.isSnoozeEnabled,
                    selectedDays: $viewModel.selectedDays
                )
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            
            Spacer()
        }
        .onAppear {
            if let alarm = viewModel.editAlarm {
                viewModel.loadAlarm(alarm)
            }
        }
        .navigationBarBackButtonHidden()
    }
}
