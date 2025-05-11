//
//  Array+.swift
//  KKewo-iOS
//
//  Created by 여성일 on 5/11/25.
//

import SwiftUI

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
