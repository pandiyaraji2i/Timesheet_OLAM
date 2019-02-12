//
//  DateUtilities.swift
//  Timesheet
//
//  Created by Lateesh on 05/02/19.
//  Copyright © 2019 Lateesh. All rights reserved.
//

import Foundation

func getMondayOfCurrentWeek(currentDate: Date) -> Date {
    let currentDay = Calendar.current.component(.weekday, from: currentDate)
    if currentDay != 2 {
        let multiplyFactor = 2 - currentDay
        return Calendar.current.date(byAdding: .day, value: multiplyFactor, to: currentDate)!
    }
    return currentDate
}

func getCurrentDayIndex() -> Int {
    let currentDay = Calendar.current.component(.weekday, from: Date())
    var index = 0
    if currentDay < 2 {
        index = 6
        return index
    } else {
        index = currentDay - 2
        return index
    }
}

func getPreviousWeek() -> Date {
    return Date()
}
