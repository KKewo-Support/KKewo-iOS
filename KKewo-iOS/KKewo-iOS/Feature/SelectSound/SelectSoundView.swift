//
//  SelectSoundView.swift
//  KKewo-iOS
//
//  Created by 김민경 on 5/3/25.
//

import SwiftUI

struct SelectSoundView: View {
  let soundCategories = ["전체", "신나는", "조용한", "시끄러운"]
  let soundList = ["기본 벨소리", "Leeo의 감미로운 뮤지컬", "애원하는 Friday", "Ringo의 링고링고링~", "조심스러운 Howard"]
  
  @State private var selectedCategory: String = "전체"
  @State private var selectedSound: String? = nil
  @Environment(\.dismiss) var dismiss
  @AppStorage("selectedSoundKey") private var savedSound: String = ""
  
  var body: some View {
    VStack {
      HStack {
        Button(action: {
          dismiss()
        }) {
          Image(systemName: "chevron.left")
            .imageScale(.large)
            .foregroundColor(.black)
        }
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
      .padding(.bottom, 20)
      .padding(.horizontal)
      
      // 알람 카테고리
      HStack {
        ForEach(soundCategories, id: \.self) { category in
          Button(action:{
            handleCategorySelection(category)
          }) {
            Spacer()
            
            Text(category)
              .font(.custom("Pretendard-SemiBold", size: 16))
              .foregroundColor(selectedCategory == category ? Color.white: Color.black)
              .frame(maxWidth: .infinity, minHeight: 40)
              .background(
                RoundedRectangle(cornerRadius: 20)
                  .fill(selectedCategory == category ? Color.black : Color.clear)
              )
              .overlay(
                RoundedRectangle(cornerRadius: 20)
                  .stroke(Color.gray, lineWidth: 1)
              )
            Spacer()
          }
        }
      }
      
      // 벨소리 선택
      ScrollView {
        VStack{
          // 벨소리 추천받기 버튼
          Button(action: {
            print("추천하기")
          }) {
            HStack{
              Image("soundRecommend")
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)
                .padding(.trailing, 20)
              
              Text("벨소리 추천받기")
                .font(.custom("Pretendard-SemiBold", size: 16))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray, lineWidth: 1)
            )
          }
          .padding(.horizontal)
          
          // 벨소리 목록
          ForEach(soundList, id: \.self) { sound in
            SoundList(
              sound: sound,
              isSelected: selectedSound == sound,
              onSelect: {
                selectedSound = sound
                savedSound = sound // 앱을 껐다가 켜도 저장됨
              },
              onPause: { print("\(sound) 일시정지") }
            )
          }
        }
      }
      .padding(.vertical)
    }
    .onAppear {
      selectedSound = savedSound
    }
  }
  
  // 카테고리 선택
  private func handleCategorySelection(_ category: String) {
    selectedCategory = category
    
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
  
  // 카테고리 함수 처리
  private func handleAll() {
    
  }
  private func handleExciting() {
    
  }
  private func handleQuiet() {
    
  }
  private func handleNoisy() {
    
  }
}

#Preview {
  SelectSoundView()
}
