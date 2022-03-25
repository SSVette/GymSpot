//
//  BeginWorkout.swift
//  GymSpot
//
//  Created by Dhruv Patel on 3/23/22.
//

import Foundation
import SwiftUI
import CoreData

extension Date {
    func DayOfTheWeek() -> String? {
        let date_formatter = DateFormatter()
        date_formatter.dateFormat = "EEEE"
        return date_formatter.string(from: self).capitalized
    }
}

struct TodaysWorkout {
    /**
     * Store metadata: Day of the Week, Workout Type, ...
     */
    var doftweek: String
    
    init(day: String) {
        self.doftweek = Date().DayOfTheWeek()!
        
    }
}
