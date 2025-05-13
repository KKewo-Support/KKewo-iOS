//
//  MainView.swift
//  KKewo-iOS
//
//  Created by 이승진 on 5/12/25.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 21) {
                headerView
                
                /// 중단 리스트 뷰
                AlarmListView()
            }
        }
        .padding(EdgeInsets(top: 19, leading: 16, bottom: 0, trailing: 16))
    }
    
    /// 상단 헤더 뷰 ( 로고 + 알람 생성 버튼)
    private var headerView: some View {
        HStack {
            Image(.mainLogo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 134, height: 21)
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.orange01)
            }
        }
    }
}

#Preview {
    MainView()
}
