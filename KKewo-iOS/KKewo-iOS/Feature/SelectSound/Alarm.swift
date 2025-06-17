//
//  Alarm.swift
//  KKewo-iOS
//
//  Created by 이승진 on 5/12/25.
//

import SwiftUI

struct Alarm: Identifiable {
  let id = UUID()
  let period: String  // 오전, 오후
  let time: String    // 시간
  let title: String   // 알람 이름
  let days: String    // 요일
  var isAlarmEnabled: Bool   // 알람 활성화 유무
}

/// Mock
let sampleAlarms: [Alarm] = [
  Alarm(period: "AM", time: "07:00", title: "기상 알람", days: "월 화 수", isAlarmEnabled: true),
  Alarm(period: "AM", time: "10:00", title: "미팅 알람", days: "월 수 금", isAlarmEnabled: false),
  Alarm(period: "PM", time: "12:30", title: "점심 알람", days: "주말", isAlarmEnabled: true),
  Alarm(period: "PM", time: "09:00", title: "운동 알람", days: "평일", isAlarmEnabled: false)
]
