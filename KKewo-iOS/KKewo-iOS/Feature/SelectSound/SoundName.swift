//
//  SoundName.swift
//  KKewo-iOS
//
//  Created by 김민경 on 6/25/25.
//

import Foundation

struct SoundName {
  static func fileName(for displayName: String) -> String {
    switch displayName {
    case "기본 벨소리": return "example"
    case "Leeo의 감미로운 뮤지컬": return "example"
    case "애원하는 Friday": return "example"
    case "Ringo의 링고링고링~": return "example"
    case "조심스러운 Howard": return "example"
    default: return "example"
    }
  }
  
  static func imageName(for displayName: String) -> String {
    switch displayName {
    case "기본 벨소리": return "default"
    case "Leeo의 감미로운 뮤지컬": return "leeo"
    case "애원하는 Friday": return "friday"
    case "Ringo의 링고링고링~": return "ringo"
    case "조심스러운 Howard": return "howard"
    default: return "soundRecommend"
    }
  }
}
