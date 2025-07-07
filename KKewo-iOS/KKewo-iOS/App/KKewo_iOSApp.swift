//
//  KKewo_iOSApp.swift
//  KKewo-iOS
//
//  Created by 김민경 on 5/3/25.
//

import SwiftUI
import SwiftData

@main
struct KKewo_iOSApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if AppDelegate.didOpenFromNotification {
                    MainView()
                } else {
                    OnboardingView()
                }
            }
        }
        .modelContainer(for: Alarm.self)
    }
}
