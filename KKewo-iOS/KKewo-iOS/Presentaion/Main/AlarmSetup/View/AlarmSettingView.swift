//
//  AlarmSettingView.swift
//  KKewo-iOS
//
//  Created by 이승진 on 5/12/25.
//

import SwiftUI

struct AlarmSettingView: View {
    @Binding var title: String
    @Binding var selectedSound: String
    @Binding var isRepeated: Bool
    @Binding var isSnoozeEnabled: Bool
    
    @State private var selectedDays: [String] = []
    private let days = ["월", "화", "수", "목", "금", "토", "일"]
    
    var body: some View {
        VStack(spacing: 38) {
            alarmNameRow
            soundRow
            VStack(spacing: 14) {
                repeatRow
                if isRepeated {
                    daySelectionRow
                }
            }
            remindRow
            
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        .background(.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.gray01, lineWidth: 2)
        )
    }
    
    /// 첫번째  row
    private var alarmNameRow: some View {
        HStack {
            Text("알람 이름")
                .font(.pretendard(type: .semibold, size: 18))
                .foregroundStyle(.black)
            Spacer()
            
            TextField("알람", text: $title)
                .multilineTextAlignment(.trailing)
                .font(.pretendard(type: .semibold, size: 18))
                .foregroundStyle(.gray03)
        }
    }
    
    /// 두번째 row
    private var soundRow: some View {
        HStack {
            Text("벨소리")
                .font(.pretendard(type: .semibold, size: 18))
                .foregroundColor(.black)
            Spacer()
            
            Button {
                
            } label: {
                HStack {
                    Text("Leeo의 감미로운 뮤지컬")
                        .font(.pretendard(type: .semibold, size: 18))
                        .foregroundStyle(.gray03)
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 7, height: 13)
                        .foregroundStyle(.gray03)
                }
            }
        }
    }
    
    /// 세번째 row
    private var repeatRow: some View {
        HStack {
            Text("반복")
                .font(.pretendard(type: .semibold, size: 18))
                .foregroundColor(.black)
            Spacer()
            
            Toggle("", isOn: $isRepeated)
                .toggleStyle(SwitchToggleStyle(tint: .orange01))
        }
    }
    
    /// 요일 선택 Row
    private var daySelectionRow: some View {
        HStack {
            ForEach(days, id: \.self) { day in
                Spacer()
                Text(day)
                    .font(.pretendard(type: .semibold, size: 16))
                    .foregroundColor(selectedDays.contains(day) ? .orange01 : .gray03)
                    .onTapGesture {
                        toggleDaySelection(day)
                    }
                Spacer()
            }
        }
    }
    
    /// 네번째 row
    private var remindRow: some View {
        HStack {
            Text("다시 알림")
                .font(.pretendard(type: .semibold, size: 18))
                .foregroundColor(.black)
            Spacer()
            
            Toggle("", isOn: $isSnoozeEnabled)
                .toggleStyle(SwitchToggleStyle(tint: .orange01))
        }
    }
    
    /// 요일 선택/해제 함수
    private func toggleDaySelection(_ day: String) {
        if selectedDays.contains(day) {
            selectedDays.removeAll { $0 == day }
        } else {
            selectedDays.append(day)
        }
    }
}

#Preview {
    AlarmSetupView()
}
