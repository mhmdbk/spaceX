//
//  Date+Dateable.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-03.
//

import Foundation

extension Date: Dateable {
    func getPortolioCreatedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy - hh:mm"
        formatter.timeZone = .current
        return formatter.string(from: self)
    }

    func checkIfDateInRange(years: Int) -> Bool {
        guard let pastDate = Calendar.current.date(byAdding: .year, value: -years, to: Date()) else {
            return false
        }
        return pastDate < self
    }
}
