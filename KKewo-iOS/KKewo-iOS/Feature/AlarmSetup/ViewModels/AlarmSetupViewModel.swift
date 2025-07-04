//
//  AlarmSetupViewModel.swift
//  KKewo-iOS
//
//  Created by 이승진 on 7/4/25.
//

import SwiftUI
import SwiftData

@Observable
class AlarmSetupViewModel {
    var time: Date = Date()
    var title: String = "알람"
    var selectedSound: String = "Leeo의 감미로운 아침"
    var isRepeated: Bool = false
    var isSnoozeEnabled: Bool = true
    var selectedDays: [String] = []
    
    var editAlarm: Alarm?

    // MARK: - init
    
    init(editAlarm: Alarm? = nil) {
        self.editAlarm = editAlarm
        if let alarm = editAlarm {
            loadAlarm(alarm)
        }
    }

    // MARK: - Function
    /// 기존 알람 세팅
    func loadAlarm(_ alarm: Alarm) {
        time = Calendar.current.date(from: DateComponents(hour: alarm.hour, minute: alarm.minute)) ?? Date()
        title = alarm.title
        selectedSound = alarm.soundName
        isRepeated = alarm.repeatType == .weekly
        isSnoozeEnabled = true
        selectedDays = alarm.weekdays.map { $0.rawValue }
    }

    /// 알람 저장
    func saveAlarm(context: ModelContext, dismiss: () -> Void) {
        let comps = Calendar.current.dateComponents([.hour, .minute], from: time)
        let weekdays = isRepeated ? selectedDays.compactMap { Weekday(rawValue: $0) } : []

        // 알람 있으면 수정모드
        if let alarm = editAlarm {
            alarm.hour = comps.hour ?? 7
            alarm.minute = comps.minute ?? 30
            alarm.title = title
            alarm.weekdays = weekdays
            alarm.isAlarmEnabled = true
            alarm.repeatType = isRepeated ? .weekly : .once
            alarm.soundName = selectedSound
            
            AlarmManager.shared.scheduleAlarm(alarm)
        } else {
            // 새 알람 생성
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
            AlarmManager.shared.scheduleAlarm(newAlarm)
        }
        
        try? context.save()
        dismiss()
    }
}

