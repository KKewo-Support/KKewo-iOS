//
//  AlarmManager.swift
//  KKewo-iOS
//
//  Created by 이승진 on 6/30/25.
//

import Foundation
import UserNotifications

final class AlarmManager {
    static let shared = AlarmManager()

    private init() {
        requestNotificationAuthorization()
    }

    /// 앱 처음 실행시 권한 요청하는 함수
    func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                print("🔔 권한 오류: \(error.localizedDescription)")
            } else {
                print("🔔 알림 권한 granted: \(granted)")
            }
        }
    }

    /// 알림 등록 함수
    func scheduleAlarm(_ alarm: Alarm) {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: [alarm.id.uuidString])

        guard alarm.isAlarmEnabled else { return }

        let content = UNMutableNotificationContent()
        content.title = alarm.title
        
        // 일단 기본 시스템 사운드로만 설정
        content.sound = UNNotificationSound.default
        content.userInfo = ["action": "ring", "alarmId": alarm.id.uuidString]

        if alarm.weekdays.isEmpty {
            var dateComponents = DateComponents()
            dateComponents.hour = alarm.hour
            dateComponents.minute = alarm.minute

            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

            let request = UNNotificationRequest(
                identifier: alarm.id.uuidString,
                content: content,
                trigger: trigger
            )
            
            center.add(request)
            
        } else {
            for weekday in alarm.weekdays {
                var dateComponents = DateComponents()
                dateComponents.hour = alarm.hour
                dateComponents.minute = alarm.minute
                dateComponents.weekday = weekday.toAppleWeekday

                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

                let request = UNNotificationRequest(
                    identifier: "\(alarm.id.uuidString)-\(weekday.toAppleWeekday)",
                    content: content,
                    trigger: trigger
                )

                center.add(request) { error in
                    if let error = error {
                        print("❌ 알림 등록 실패: \(error.localizedDescription)")
                    } else {
                        print("✅ 알림 등록 성공: \(request.identifier)")
                    }
                }
                
            }
        }
        
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
            for request in requests {
                print("📌 알림 ID: \(request.identifier)")
                if let trigger = request.trigger as? UNCalendarNotificationTrigger {
                    print("⏰ 예약된 시간: \(trigger.dateComponents)")
                }
            }
        }

    }

    /// 알람 제거 함수
    func cancelAlarm(_ alarm: Alarm) {
        let center = UNUserNotificationCenter.current()

        if alarm.weekdays.isEmpty {
            center.removePendingNotificationRequests(withIdentifiers: [alarm.id.uuidString])
        } else {
            let ids = alarm.weekdays.map { "\(alarm.id.uuidString)-\($0.toAppleWeekday)" }
            center.removePendingNotificationRequests(withIdentifiers: ids)
        }
    }

    /// 알림 활성화 상태에 따라 예약 or 취소
    func toggleAlarm(_ alarm: Alarm) {
        if alarm.isAlarmEnabled {
            scheduleAlarm(alarm)
        } else {
            cancelAlarm(alarm)
        }
    }
}
