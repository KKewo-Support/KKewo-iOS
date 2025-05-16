//
//  AlarmListView.swift
//  KKewo-iOS
//
//  Created by 이승진 on 5/12/25.
//

import SwiftUI

struct AlarmListView: View {
    @State private var alarms: [Alarm] = sampleAlarms

    var body: some View {
        List {
            ForEach($alarms) { $alarm in
                HStack {
                    VStack(alignment: .leading) {
                        HStack(alignment: .bottom, spacing: 6) {
                            Text(alarm.period)
                                .font(.pretendard(type: .semibold, size: 20))
                            
                            Text(alarm.time)
                                .font(.pretendard(type: .medium, size: 40))
                        }
                        
                        Text("\(alarm.title), \(alarm.days)")
                            .font(.pretendard(type: .semibold, size: 16))
                            .foregroundColor(.gray03)
                    }
                    
                    Spacer()
                    
                    Toggle("", isOn: $alarm.isAlarmEnabled)
                        .toggleStyle(SwitchToggleStyle(tint: .orange01))
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
            .onDelete(perform: deleteAlarm)
        }
        .listStyle(.plain)
    }
    
    /// 삭제 함수
    private func deleteAlarm(at offsets: IndexSet) {
        alarms.remove(atOffsets: offsets)
    }
}

#Preview {
    AlarmListView()
}

