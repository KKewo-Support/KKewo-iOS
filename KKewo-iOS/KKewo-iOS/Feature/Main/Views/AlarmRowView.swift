//
//  AlarmRowView.swift
//  KKewo-iOS
//
//  Created by 이승진 on 6/29/25.
//

import SwiftUI

struct AlarmRowView: View {
    @Bindable var alarm: Alarm
    @Environment(\.modelContext) private var context
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack(alignment: .bottom, spacing: 6) {
                    Text(alarm.hour < 12 ? "AM" : "PM")
                        .font(.pretendard(type: .semibold, size: 20))
                    
                    Text(String(format: "%02d:%02d", alarm.hour % 12 == 0 ? 12 : alarm.hour % 12, alarm.minute))
                        .font(.pretendard(type: .medium, size: 40))
                }
                
                let daysText = alarm.displayDaysText
                Text(
                    daysText.isEmpty
                    ? "\(alarm.title)"
                    : "\(alarm.title), \(daysText)"
                )
                .font(.pretendard(type: .semibold, size: 16))
                .foregroundColor(.gray03)
            }
            
            Spacer()
            
            Toggle("", isOn: $alarm.isAlarmEnabled)
                .onChange(of: alarm.isAlarmEnabled) {
                    try? context.save()
                    AlarmManager.shared.toggleAlarm(alarm)
                }
                .toggleStyle(SwitchToggleStyle(tint: .orange01))
        }
        .opacity(alarm.isAlarmEnabled ? 1.0 : 0.5)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray01, lineWidth: 1)
                .padding(EdgeInsets(top: -10, leading: -10, bottom: -10, trailing: -10))
        )
    }
}
