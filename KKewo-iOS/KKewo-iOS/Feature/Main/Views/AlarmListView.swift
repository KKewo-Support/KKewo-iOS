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
                AlarmRowView(alarm: alarm)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedAlarm = alarm
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    .padding(.bottom, 8)
            }
            .onDelete(perform: deleteAlarms)
        }
        .listStyle(.plain)
        .navigationDestination(item: $selectedAlarm) { alarm in
            AlarmSetupView(viewModel: AlarmSetupViewModel(editAlarm: alarm))
        }
    }
    
    // MARK: - Function
    /// 알람 삭제 함수
    private func deleteAlarms(at offsets: IndexSet) {
        for index in offsets {
            let alarm = alarms[index]
            AlarmManager.shared.cancelAlarm(alarm)
            context.delete(alarm)
        }
        
        try? context.save()
    }
}
