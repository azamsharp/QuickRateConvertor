//
//  ContentView.swift
//  QuickRateConvertor-iOS
//
//  Created by Mohammad Azam on 3/29/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm: QuickRateViewModel
    
    init(vm: QuickRateViewModel) {
        self._vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    
                    TextField("Enter rate", text: $vm.rate)
                        .textFieldStyle(.plain)
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .multilineTextAlignment(.center)
                    .foregroundColor(.green)
                    .onChange(of: vm.rate) { _ in
                        vm.calculate()
                    }
                }
                
                Picker(selection: $vm.rateType) {
                    ForEach(RateType.allCases, id: \.self) { rateType in
                        Text(rateType.rawValue)
                    }
                } label: {
                    EmptyView()
                }.pickerStyle(.segmented)
                    .onChange(of: vm.rateType, perform: { _ in
                        vm.calculate()
                    })
                    .padding(.top, 20)
                
                Spacer()
                
                switch vm.rateType {
                    case .hourly:
                        SalaryView(title: "Monthly", rate: vm.monthlyRate.formatAsCurrency(), color: .green)
                        SalaryView(title: "Yearly", rate: vm.yearlyRate.formatAsCurrency(), color: .purple)
                    case .monthly:
                        SalaryView(title: "Hourly", rate: vm.hourlyRate.formatAsCurrency(), color: .orange)
                        SalaryView(title: "Yearly", rate: vm.yearlyRate.formatAsCurrency(), color: .purple)
                    case .yearly:
                        SalaryView(title: "Hourly", rate: vm.hourlyRate.formatAsCurrency(), color: .orange)
                        SalaryView(title: "Monthly", rate: vm.monthlyRate.formatAsCurrency(), color: .green)
                }
                
                
                Spacer()
                
                    .navigationTitle("Quick Rate")
                
            }.padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(vm: QuickRateViewModel())
            ContentView(vm: QuickRateViewModel())
                .environment(\.colorScheme, .dark)
        }
    }
}
