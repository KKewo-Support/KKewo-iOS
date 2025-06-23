//
//  RepeatType.swift
//  KKewo-iOS
//
//  Created by 이승진 on 6/20/25.
//

import Foundation

/// 반복 타입 정의
enum RepeatType: String, Codable, CaseIterable {
    case once
    case daily
    case weekly
}
