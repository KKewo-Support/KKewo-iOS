//
//  SoundList.swift
//  KKewo-iOS
//
//  Created by 김민경 on 5/15/25.
//

import SwiftUI

enum PlaybackState {
  case playing
  case paused
  
  var iconName: String {
    switch self {
    case .playing: return "pause"
    case .paused: return "sound"
    }
  }
}

struct SoundList: View {
  let sound: String
  let isSelected: Bool
  let onSelect: () -> Void
  let onPause: () -> Void
  
  @State private var playbackState: PlaybackState = .paused
  
  var body: some View {
    Button(action: onSelect) {
      HStack {
        Image(asset: .soundRecommend)
          .resizable()
          .scaledToFit()
          .frame(width: 44, height: 44)
        
        HStack(spacing: 6) {
          if isSelected {
            Image(asset: .sound)
              .resizable()
              .scaledToFit()
              .frame(width: 18, height: 18)
          }
          
          Text(sound)
            .font(.custom("Pretendard-SemiBold", size: 16))
            .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
        if isSelected {
          Button(action: onPause) {
            Image(asset: .pause)
              .resizable()
              .scaledToFit()
              .frame(width: 24, height: 24)
          }
        }
      }
      .padding()
      .background(
        RoundedRectangle(cornerRadius: 16)
          .fill(isSelected ? Color.orange.opacity(0.2) : Color.clear)
          .overlay(
            RoundedRectangle(cornerRadius: 16)
              .stroke(isSelected ? Color.orange : Color.gray, lineWidth: 1)
          )
      )
    }
    .padding(.horizontal)
  }
  
  private func togglePlayback() {
    switch playbackState {
    case .paused:
      playbackState = .playing
      onSelect()
    case .playing:
      playbackState = .paused
      onPause()
    }
  }
}

#Preview {
  SoundList(
    sound: "기본 벨소리",
    isSelected: true,
    onSelect: {},
    onPause: {}
  )
}
