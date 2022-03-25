//
//  WeekDay.swift
//  GymSpot
//
//  Created by Robby Hechler on 3/25/22.
//

import Foundation
import SwiftUI

struct WorkoutRegime: Identifiable {
    let id: UUID
    var title: String
    var equipment: String
    var musclegroup: String
    var reps: Int16
    var sets: Int16
    
    init(id: UUID = UUID(), title: String, equipment: String, mgroup: String, sets: Int16, reps: Int16) {
        self.id = id
        self.title = title
        self.equipment = equipment
        self.musclegroup = mgroup
        self.reps = reps
        self.sets = sets
    }
}

extension WorkoutRegime {
    static let WRView: [WorkoutRegime] = [
        WorkoutRegime(title: "Bench Press", equipment: "Barbell", mgroup: "Chest", sets: 3, reps: 10),
        WorkoutRegime(title: "Incline Bench Press", equipment: "Dumbbells", mgroup: "Chest", sets: 3, reps: 10)
    ]
}


struct PresentationCard: View {
    let regime: WorkoutRegime
    var body: some View {
            Text(regime.title)
            VStack {
                List {
                    VStack (alignment: .leading) {
                        Text("\(regime.musclegroup) - \(regime.equipment)").font(.headline)
                    }
                    Spacer()
                }
            }
            .padding()
    }
}

struct WorkoutView: View {
    let regime: WorkoutRegime
    var body: some View {
        Text(regime.title)
        VStack {
            List {
                HStack {
                    VStack (alignment: .leading) {
                        Text("\(regime.musclegroup) - \(regime.equipment)").font(.headline)
                    }
                    Spacer()
                }
            }
        }
        .padding()
        .navigationTitle(regime.title)
    }
}

struct WeekdayContextView: View {
    let workout: WorkoutRegime
    var body: some View {
        List {
            WorkoutView(regime: workout)
        }
    }
}
