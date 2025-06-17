//
//  RecommendSoundView.swift
//  KKewo-iOS
//
//  Created by 여성일 on 5/10/25.
//

import SwiftUI

struct RecommendSoundView: View {
  @State private var selectedChips: Set<String> = []
  
  // 카테고리가 확정되지 않아 일단 mock Chips를 사용합니다.
  let chips = ["개성있는", "활발한", "조심스러운", "단호한", "신기한", "시끄러운", "재미있는", "재치있는", "기가막힌", "무서운", "카리스마있는", "맛있는"]
  
  var body: some View {
    ZStack(alignment: .topLeading) {
      Color.clear.ignoresSafeArea()
      
      VStack(alignment: .leading) {
        VStack(alignment: .leading, spacing: 4) {
          Text("어떤 스타일이 좋으세요?")
            .font(.pretendard(type: .bold, size: 28))
            .foregroundStyle(.gray05)
          
          Text("취향에 맞는 알람을 추천해 드려요!")
            .font(.pretendard(type: .medium, size: 18))
            .foregroundStyle(.gray02)
        }.padding(.bottom, 44)
        
        ForEach(chips.chunked(into: 3), id: \.self) { row in
          RecommendChipsView(
            selectedChips: $selectedChips,
            chips: row,
          )
          .frame(height: 64)
        }
        
        Spacer()
        
        CustomBorderButton(action: { },
                           title: "완료",
                           titleColor: !selectedChips.isEmpty ? .white : .gray02, backgroundColor: !selectedChips.isEmpty ? .orange01 : .gray01
        )
        .disabled(selectedChips.isEmpty)
      }
    }
    .padding(.horizontal, 24)
    .padding(.top, 68)
    .navigationTitle("알람벨 추천받기")
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button {
          
        } label: {
          Image(systemName: "xmark")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.black)
            .frame(width: 12, height: 12)
        }
      }
    }
  }
}

#Preview {
  NavigationStack {
    RecommendSoundView()
  }
}
