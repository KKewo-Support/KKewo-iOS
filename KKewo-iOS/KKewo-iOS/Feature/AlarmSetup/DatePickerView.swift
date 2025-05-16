//
//  DatePickerView.swift
//  KKewo-iOS
//
//  Created by 이승진 on 5/12/25.
//

import SwiftUI

struct DatePickerView: View {
    @Binding var time: Date
    
    var body: some View {
        ZStack {
            DatePicker(
                "",
                selection: $time,
                displayedComponents: [.hourAndMinute]
            )
            .datePickerStyle(.wheel)
            .labelsHidden()
            .frame(height: 200)
            .background(.white)
            .cornerRadius(12)
            .padding(.horizontal)
//            RoundedRectangle(cornerRadius: 12)
//                .frame(width: 300, height: 40)
//                .foregroundStyle(.orange)
//                .opacity(0.51)
//                .colorMultiply(.orange01)
        }
    }
}

#Preview {
    DatePickerView(time: .constant(Date()))
}
