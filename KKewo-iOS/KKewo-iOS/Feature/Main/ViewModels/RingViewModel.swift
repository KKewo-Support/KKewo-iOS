//
//  RingViewModel.swift
//  KKewo-iOS
//
//  Created by 이승진 on 7/4/25.
//

import Foundation
import AVFoundation
import SwiftData

@Observable
class RingViewModel {
    private var player: AVAudioPlayer?

    /// 벨소리 재생 시작
    func startAlarm() {
        setupAudioSession()
        playSound()
    }

    /// 벨소리 정지
    func stopAlarm() {
        player?.stop()
    }

    /// 스누즈 (5분 뒤 다시 알림)
    func snooze() {
        let snoozeDate = Calendar.current.date(byAdding: .minute, value: 5, to: Date()) ?? Date()
        let comps = Calendar.current.dateComponents([.hour, .minute], from: snoozeDate)

        let newAlarm = Alarm(
            hour: comps.hour ?? 7,
            minute: comps.minute ?? 0,
            title: "다시 알림",
            weekdays: [],
            isAlarmEnabled: true,
            repeatType: .once,
            soundName: "example"
        )

        if let container = try? ModelContainer(for: Alarm.self) {
            let context = ModelContext(container)
            context.insert(newAlarm)
            try? context.save()
            AlarmManager.shared.scheduleAlarm(newAlarm)
        }
    }

    /// 오디오 세션 설정
    private func setupAudioSession() {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playback, mode: .default)
            try audioSession.setActive(true)
        } catch {
            print("AVAudioSession 설정 실패: \(error.localizedDescription)")
        }
    }

    /// 벨소리 재생
    private func playSound() {
        guard let url = Bundle.main.url(forResource: "example", withExtension: "mp3") else {
            print("벨소리 파일을 찾을 수 없음")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1
            player?.play()
        } catch {
            print("벨소리 재생 실패: \(error.localizedDescription)")
        }
    }
}
