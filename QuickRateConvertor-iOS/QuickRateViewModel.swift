//
//  QuickRateViewModel.swift
//  QuickRateConvertor-iOS
//
//  Created by Mohammad Azam on 3/29/22.
//

import Foundation

enum RateType: String, CaseIterable {
    case hourly = "Hourly"
    case monthly = "Monthly"
    case yearly = "Yearly"
}

@MainActor
class QuickRateViewModel: ObservableObject {
    
    @Published var rate: String = ""
    @Published var rateType: RateType = .hourly
    @Published var hourlyRate: Double = 0.0
    @Published var monthlyRate: Double = 0.0
    @Published var yearlyRate: Double = 0.0
    
    func calculate() {
        
        guard let rateAmount = Double(rate) else {
            monthlyRate = 0.0
            yearlyRate = 0.0
            hourlyRate = 0.0
            return
            
        }
        
        switch rateType {
            case .hourly:
                monthlyRate = rateAmount * 173.33
                yearlyRate = rateAmount * 2087
            case .monthly:
                hourlyRate = rateAmount / 173.33
                yearlyRate = rateAmount * 12
            case .yearly:
                hourlyRate = rateAmount / 2087
                monthlyRate = rateAmount / 12
        }
        
    }
}
