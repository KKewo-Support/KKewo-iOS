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
    }
  }
}

#Preview {
  DatePickerView(time: .constant(Date()))
}
