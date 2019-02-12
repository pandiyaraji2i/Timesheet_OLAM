//
//  DayModel.swift
//  Timesheet
//
//  Created by Lateesh on 05/02/19.
//  Copyright © 2019 Lateesh. All rights reserved.
//

import Foundation

class DayModel {
    var day: String!
    var month: String!
    var date: String!
    var year: String
    init (day: String, month: String , date: String, year: String) {
        self.day = day
        self.month = month
        self.date = date
        self.year = year
    }
}
