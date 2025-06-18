//
//  SoundCategoryViewLogic.swift
//  KKewo-iOS
//
//  Created by 김민경 on 6/16/25.
//

import Foundation

class SoundCategoryViewLogic {
  static private let soundList = ["기본 벨소리", "Leeo의 감미로운 뮤지컬", "애원하는 Friday", "Ringo의 링고링고링~", "조심스러운 Howard"]
  
  static func handleCategory(_ category: String) -> [String] {
    switch category {
    case "전체":
      return soundList
    case "신나는":
      return ["Leeo의 감미로운 뮤지컬", "Ringo의 링고링고링~"]
    case "조용한":
      return ["조심스러운 Howard"]
    case "시끄러운":
      return ["애원하는 Friday"]
    default:
      return soundList
    }
  }
  
  static func handleAll() {
    print("전체")
  }
}
