//
//  AlarmListView.swift
//  KKewo-iOS
//
//  Created by 이승진 on 5/12/25.
//

import SwiftUI
import SwiftData

struct AlarmListView: View {
    @Query(sort: [SortDescriptor(\Alarm.hour)]) var alarms: [Alarm]
    @Environment(\.modelContext) private var context
    @State private var selectedAlarm: Alarm?
    
    var body: some View {
        List {
            ForEach(alarms) { alarm in
                HStack {
                    VStack(alignment: .leading) {
                        HStack(alignment: .bottom, spacing: 6) {
                            // 오전, 오후
                            Text(alarm.hour < 12 ? "AM" : "PM")
                                .font(.pretendard(type: .semibold, size: 20))
                            
                            // 알람 시간
                            Text(String(format: "%02d:%02d", alarm.hour % 12 == 0 ? 12 : alarm.hour % 12, alarm.minute))
                                .font(.pretendard(type: .medium, size: 40))
                        }
                        
                        // 알람 이름, 요일
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
                    
                    Toggle("", isOn: Binding(
                        get: { alarm.isAlarmEnabled },
                        set: { newValue in
                            alarm.isAlarmEnabled = newValue
                            try? context.save()
                        }
                    ))
                    .toggleStyle(SwitchToggleStyle(tint: .orange01))
                }
                .contentShape(Rectangle()) // 셀 전체 탭 가능하게
                .onTapGesture {
                    selectedAlarm = alarm
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                .opacity(alarm.isAlarmEnabled ? 1.0 : 0.5)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray01, lineWidth: 1)
                        .padding(EdgeInsets(top: -10, leading: -20, bottom: -10, trailing: -20))
                )
                .padding(.bottom, 8)
            }
            .onDelete(perform: deleteAlarms)
        }
        .listStyle(.plain)
        .navigationDestination(item: $selectedAlarm) { alarm in
            AlarmSetupView(editAlarm: alarm)
        }
    }
    
    // MARK: - Function
    /// 알람 삭제 함수
    private func deleteAlarms(at offsets: IndexSet) {
        for index in offsets {
            context.delete(alarms[index])
        }
        try? context.save()
    }
}
