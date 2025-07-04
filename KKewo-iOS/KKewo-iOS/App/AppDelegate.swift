//
//  AppDelegate.swift
//  KKewo-iOS
//
//  Created by 이승진 on 6/30/25.
//

import UIKit
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    static var didOpenFromNotification = false
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    
    // 알림 클릭 시 호출
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let userInfo = response.notification.request.content.userInfo
        if userInfo["action"] as? String == "ring" {
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: .didReceiveAlarmTrigger, object: nil)
            }
        }
        
        completionHandler()
    }
}

extension Notification.Name {
    static let didReceiveAlarmTrigger = Notification.Name("didReceiveAlarmTrigger")
}
