//
//  WeekDay.swift
//  KKewo-iOS
//
//  Created by 이승진 on 6/20/25.
//

import Foundation

/// 요일 정의
enum Weekday: String, CaseIterable, Codable {
    case mon = "월"
    case tue = "화"
    case wed = "수"
    case thu = "목"
    case fri = "금"
    case sat = "토"
    case sun = "일"
    
    var toAppleWeekday: Int {
        switch self {
        case .sun: return 1
        case .mon: return 2
        case .tue: return 3
        case .wed: return 4
        case .thu: return 5
        case .fri: return 6
        case .sat: return 7
        }
    }
}
