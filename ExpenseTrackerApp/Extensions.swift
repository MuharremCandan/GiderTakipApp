//
//  Extensions.swift
//  ExpenseTrackerApp
//
//  Created by Muharrem Candan on 16.05.2024.
//

import Foundation
import SwiftUI


extension Color {
    static let background1 = Color("Background")
    static let icon1 = Color("Icon")
    static let text1 = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
    
}
extension DateFormatter{
    static let allNumericUSA : DateFormatter = {
        print("Initiaziling Dateformatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yy"
        return formatter
    
        
    }()
}
extension String {
    func dateParsed() -> Date{
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else{return Date()}
        return parsedDate
    }
}
extension Date : Strideable{
    func formatted() -> String{
        return self.formatted(.dateTime.year().month().day())
    }
}
extension Double{
    func roundedTo2Digits() -> Double {
        return (self * 100).rounded() / 100
    }
}
