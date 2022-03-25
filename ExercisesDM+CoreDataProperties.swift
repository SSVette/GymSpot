//
//  ExercisesDM+CoreDataProperties.swift
//  GymSpot
//
//  Created by Robby Hechler on 3/25/22.
//
//

import Foundation
import CoreData


extension ExercisesDM {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExercisesDM> {
        return NSFetchRequest<ExercisesDM>(entityName: "ExercisesDM")
    }

    @NSManaged public var equipment: String
    @NSManaged public var musclegroup: String
    @NSManaged public var name: String
    @NSManaged public var reps: Int16
    @NSManaged public var sets: Int16

}

extension ExercisesDM : Identifiable {

}
