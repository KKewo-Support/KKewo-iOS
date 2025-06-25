//
//  Alarm.swift
//  KKewo-iOS
//
//  Created by 이승진 on 5/12/25.
//

import Foundation
import SwiftData

@Model
final class Alarm {
    @Attribute(.unique) var id: UUID
    var hour: Int              // 시간
    var minute: Int            // 분
    var title: String          // 알람 이름
    var weekdays: [Weekday]    // 반복 요일 (비었으면 반복 없음)
    var isAlarmEnabled: Bool   // 알람 활성화 여부
    var repeatType: RepeatType // 반복 유형
    var soundName: String      // 벨소리 이름

    init(
        id: UUID = UUID(),
        hour: Int,
        minute: Int,
        title: String,
        weekdays: [Weekday],
        isAlarmEnabled: Bool = true,
        repeatType: RepeatType,
        soundName: String
    ) {
        self.id = id
        self.hour = hour
        self.minute = minute
        self.title = title
        self.weekdays = weekdays
        self.isAlarmEnabled = isAlarmEnabled
        self.repeatType = repeatType
        self.soundName = soundName
    }
}

extension Alarm {
    /// 요약된 문자열
    var displayDaysText: String {
        let rawValues = Set(weekdays.map { $0.rawValue })
        let weekdaySet: Set<String> = ["월", "화", "수", "목", "금"]
        let weekendSet: Set<String> = ["토", "일"]

        if rawValues == weekdaySet {
            return "평일"
        } else if rawValues == weekendSet {
            return "주말"
        } else {
            let ordered = ["월", "화", "수", "목", "금", "토", "일"]
            return ordered.filter { rawValues.contains($0) }.joined(separator: " ")
        }
    }
}
