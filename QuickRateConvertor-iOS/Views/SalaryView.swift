//
//  SalaryView.swift
//  QuickRateConvertor-iOS
//
//  Created by Mohammad Azam on 3/29/22.
//

import SwiftUI

struct SalaryView: View {
    
    let title: String
    let rate: String
    let color: Color
    
    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 22))
            Spacer()
            Text(rate)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 28))
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 200)
        .background(color)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

struct SalaryView_Previews: PreviewProvider {
    static var previews: some View {
        SalaryView(title: "Hourly", rate: "100", color: .green)
    }
}
