//
//  WeeklySchedule+CoreDataProperties.swift
//  GymSpot
//
//  Created by Robby Hechler on 3/25/22.
//
//

import Foundation
import CoreData


extension WeeklySchedule {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeeklySchedule> {
        return NSFetchRequest<WeeklySchedule>(entityName: "WeeklySchedule")
    }

    @NSManaged public var weekday: String
    @NSManaged public var workout: ExercisesDM

}

extension WeeklySchedule : Identifiable {

}
