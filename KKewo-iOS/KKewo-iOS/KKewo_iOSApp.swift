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
  var body: some Scene {
    WindowGroup {
      NavigationStack {
        OnboardingView()
      }
    }
    .modelContainer(for: Alarm.self)
  }
}
