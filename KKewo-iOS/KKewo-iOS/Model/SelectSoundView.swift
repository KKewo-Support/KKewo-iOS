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
            Button(action: {}) {
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
        let soundCategories = ["전체", "신나는", "조용한", "시끄러운"]
        HStack {
            ForEach(soundCategories, id: \.self) { category in
                Button(action:{
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
                }) {
                    Spacer()

                    Text(category)
                        .font(.custom("Pretendard-SemiBold", size: 16))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .cornerRadius(20)
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
            }
        }
    }
}

func handleAll() {
    print("all")
}

func handleExciting() {
    print("exciting")
}

func handleQuiet() {
    print("quiet")
}

func handleNoisy() {
    print("noisy")
}

#Preview {
    SelectSoundView()
}
