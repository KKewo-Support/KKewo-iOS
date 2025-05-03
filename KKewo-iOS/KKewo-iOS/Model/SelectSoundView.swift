//
//  SelectSoundView.swift
//  KKewo-iOS
//
//  Created by 김민경 on 5/3/25.
//

import SwiftUI

struct SelectSoundView: View {
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
                .imageScale(.large)
                .foregroundColor(.black)
            Spacer()

            Text("벨소리")
                .font(.custom("Pretendard-SemiBold", size: 18))
                .frame(maxWidth: .infinity, alignment: .trailing)
            Spacer()

            Button(action: {}) {
                Text("완료")
                    .font(.custom("Pretendard-Regular", size: 20))
                    .foregroundColor(.orange)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .padding(.top, 10)
        .padding(.horizontal)
    }
}

#Preview {
    SelectSoundView()
}
