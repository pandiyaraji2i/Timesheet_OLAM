//
//  DateExtensions.swift
//  Timesheet
//
//  Created by Lateesh on 05/02/19.
//  Copyright © 2019 Lateesh. All rights reserved.
//

import Foundation

extension Date {
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self)
    }
    var day: String {
        let index = Calendar.current.component(.weekday, from: self)
        return Calendar.current.weekdaySymbols[index - 1]
    }
    var year: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: self)
    }
}
