//
//  SelectSoundView.swift
//  KKewo-iOS
//
//  Created by 김민경 on 5/3/25.
//

import SwiftUI
import AVFoundation

struct SelectSoundView: View {
  let soundCategories = ["전체", "신나는", "조용한", "시끄러운"]
  
  @State private var selectedCategory: String = "전체"
  @State private var selectedSound: String? = nil
  @Environment(\.dismiss) var dismiss
  @AppStorage("selectedSoundKey") private var savedSound: String = ""
  @StateObject private var soundPlayer = SoundPlayer()
  
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
          ForEach(SoundCategoryViewLogic.handleCategory(selectedCategory), id: \.self) { sound in
            SoundList(
              sound: sound,
              isSelected: selectedSound == sound,
              onSelect: {
                if selectedSound == sound {
                  soundPlayer.pause()
                  selectedSound = nil
                  savedSound = ""
                } else {
                  selectedSound = sound
                  savedSound = sound // 앱을 껐다가 켜도 저장됨
                  
                  // 재생
                  soundPlayer.play(soundName: sound)
                  
                  onPause: do { print("\(sound) 일시정지") }
                }
              },
              onPause: {
                soundPlayer.pause()
              }
            )
          }
        }
      }
      .padding(.vertical)
    }
    .navigationBarBackButtonHidden()
    .onAppear {
      selectedSound = savedSound
      soundPlayer.play(soundName: "example") // example.mp3
    }
  }
  
  private func handleCategorySelection(_ category: String) {
    selectedCategory = category
    SoundCategoryViewLogic.handleCategory(category)
  }
}

#Preview {
  SelectSoundView()
}
