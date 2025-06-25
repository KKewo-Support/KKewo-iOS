//
//  SoundPlayer.swift
//  KKewo-iOS
//
//  Created by 김민경 on 6/25/25.
//

import Foundation
import AVFoundation

final class SoundPlayer: ObservableObject {
  private var player: AVAudioPlayer?
  
  func play(soundName: String) {
    stop()
    
    let fileName = SoundName.fileName(for: soundName)
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
      print("\(fileName).mp3 파일 없음")
      return
    }
    
    do {
      player = try AVAudioPlayer(contentsOf: url)
      player?.prepareToPlay()
      player?.play()
      print("\(fileName).mp3 재생")
    } catch {
      print("재생 실패: \(error.localizedDescription)")
    }
  }
  
  func pause() {
    player?.pause()
  }
  
  func stop() {
    if player?.isPlaying == true {
      player?.stop()
    }
  }
}
