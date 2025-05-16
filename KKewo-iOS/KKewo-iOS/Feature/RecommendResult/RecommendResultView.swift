//
//  RecommendResultView.swift
//  KKewo-iOS
//
//  Created by 여성일 on 5/13/25.
//

import SwiftUI

struct RecommendResultView: View {
    @State private var isButtonState: Bool = false
    @State private var isOverlayShow: Bool = false
    @State private var isButtonTapped: Bool = false

    private var imageState: String {
        return isButtonState ? "pause.fill" : "play.fill"
    }

    var body: some View {
        ZStack(alignment: .top) {
            Color.clear.ignoresSafeArea()

            VStack {
                Text("애원하는 프라이데이")
                    .font(.pretendard(type: .bold, size: 32))
                    .foregroundStyle(.gray05)

                VStack(spacing: -1) {
                    Text(#""제발 일어나주세요...ㅠㅠ""#)
                        .font(.pretendard(type: .semibold, size: 14))
                        .foregroundStyle(.gray03)
                        .lineLimit(1)
                        .frame(height: 45)
                        .padding(.horizontal, 24)
                        .background(.white)
                        .clipShape(.capsule)
                        .shadow(color: .gray01, radius: 10)

                    Image("tailshadow")
                        .renderingMode(.template)
                        .foregroundStyle(.white)
                        .padding(.leading, 100)
                }
                .padding(.top, 67)

                Button {
                    playButtonTapped()
                } label: {
                    Image("SampleResult")
                        .aspectRatio(contentMode: .fill)
                        .overlay(
                            ZStack {
                                Color.black.opacity(0.4)
                                Image(systemName: imageState)
                                    .font(.system(size: 30))
                                    .foregroundColor(.orange01)
                            }
                            .opacity(isOverlayShow ? 1 : 0)
                        )
                }
                .buttonStyle(.plain)
                .frame(maxWidth: 200, maxHeight: 200)
                .clipShape(.circle)
                .padding(.top, -10)

                Text("사진을 눌러 멘토의 알람을 들어보세요")
                    .font(.pretendard(type: .semibold, size: 16))
                    .foregroundStyle(.gray02)
                    .padding(.top, 50)

                Spacer()

                VStack(spacing: 12) {
                    CustomBorderButton(action: {},
                                       title: "알람 맞추러 가기"
                    )

                    CustomBorderButton(action: {},
                                       title: "다시하기",
                                       titleColor: .orange01,
                                       backgroundColor: .orange00
                    )
                }
                .padding(.bottom, 24)
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 50)
        .navigationTitle("알람벨 추천받기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // 닫기 동작
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

private extension RecommendResultView {
    func playButtonTapped() {
        withAnimation(.easeInOut) {
            isButtonState.toggle()
            isButtonTapped = true
        }

        handleOverlay()
    }

    func handleOverlay() {
        if isButtonState {
            withAnimation(.easeInOut) {
                isOverlayShow = true
            }
        } else {
            withAnimation(.easeInOut) {
                isOverlayShow = true
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                if !isButtonState {
                    withAnimation(.easeInOut) {
                        isOverlayShow = false
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        RecommendResultView()
    }
}

