//
//  SoundCategoryViewLogic.swift
//  KKewo-iOS
//
//  Created by 김민경 on 6/16/25.
//

import Foundation

class SoundCategoryViewLogic {
  static func handleCategory(_ category: String) {
    switch category {
    case "전체":
      handleAll()
    case "신나는":
      handleExciting()
    case "조용한":
      handleQuiet()
    case "시끄러운":
      handleNoisy()
    default:
      handleAll()
    }
  }
  
  static func handleAll() {
    print("전체")
  }
  
  static func handleExciting() {
    print("신나는")
  }
  
  static func handleQuiet() {
    print("조용한")
  }
  
  static func handleNoisy() {
    print("시끄러운")
  }
}
