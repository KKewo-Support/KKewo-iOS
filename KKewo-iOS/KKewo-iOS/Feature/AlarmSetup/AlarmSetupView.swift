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
    
    var editAlarm: Alarm? = nil
    
    @State private var time: Date = Date()
    @State private var title: String = "알람"
    @State private var selectedSound: String = "Leeo의 감미로운 아침"
    @State private var isRepeated: Bool = false
    @State private var isSnoozeEnabled: Bool = true
    @State private var selectedDays: [String] = []
    
    var body: some View {
        VStack(spacing: 47) {
            CustomNavigationBar(
                title: "알람 맞추기",
                rightButtonContent: Text("완료")
                    .font(.system(size: 18, weight: .regular))
                    .foregroundStyle(.orange),
                rightButtonAction: {
                    saveAlarm()
                }
            )
            
            VStack(spacing: 43){
                DatePickerView(time: $time)
                
                AlarmSettingView(
                    title: $title,
                    selectedSound: $selectedSound,
                    isRepeated: $isRepeated,
                    isSnoozeEnabled: $isSnoozeEnabled,
                    selectedDays: $selectedDays
                )
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            
            Spacer()
        }
        .onAppear {
            if let alarm = editAlarm {
                time = Calendar.current.date(from: DateComponents(hour: alarm.hour, minute: alarm.minute)) ?? Date()
                title = alarm.title
                selectedSound = alarm.soundName
                isRepeated = alarm.repeatType == .weekly
                isSnoozeEnabled = true
                selectedDays = alarm.weekdays.map { $0.rawValue }
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    // MARK: - Function
    /// 알림 저장 함수
    private func saveAlarm() {
        let comps = Calendar.current.dateComponents([.hour, .minute], from: time)
        let weekdays = isRepeated ? selectedDays.compactMap { Weekday(rawValue: $0) } : []
        
        if let alarm = editAlarm {
            alarm.hour = comps.hour ?? 7
            alarm.minute = comps.minute ?? 30
            alarm.title = title
            alarm.weekdays = weekdays
            alarm.isAlarmEnabled = true
            alarm.repeatType = isRepeated ? .weekly : .once
            alarm.soundName = selectedSound
        } else {
            let newAlarm = Alarm(
                hour: comps.hour ?? 7,
                minute: comps.minute ?? 30,
                title: title,
                weekdays: weekdays,
                isAlarmEnabled: true,
                repeatType: isRepeated ? .weekly : .once,
                soundName: selectedSound
            )
            context.insert(newAlarm)
        }
        
        try? context.save()
        dismiss()
    }
}
