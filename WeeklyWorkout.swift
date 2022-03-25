//
//  WeeklyWorkout.swift
//  GymSpot
//
//  Created by Dhruv Patel on 3/23/22.
//

import Foundation
import SwiftUI


// NoteCards
struct WeeklyNoteCard: Identifiable {
    let id: UUID
    var title: String
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, theme: Theme) {
        self.id = id
        self.title = title
        self.theme = theme
    }
}

// Card View
struct CNCards: View {
    
    let week: WeeklyNoteCard
    let workouts: [WorkoutRegime] = WorkoutRegime.WRView
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(week.title).font(.headline)
            NavigationLink(destination: WeekdayContextView(workout: WorkoutRegime.WRView[0])) {
                PresentationCard(regime: WorkoutRegime.WRView[0])
            }
            Spacer()
        }.listStyle(PlainListStyle())
        .navigationTitle(week.title)
        .padding()
        .foregroundColor(week.theme.AccentColor)
    }
}

extension WeeklyNoteCard {
    static let WView: [WeeklyNoteCard] = [
        WeeklyNoteCard(title: "Monday", theme: .yellow),
        WeeklyNoteCard(title: "Tuesday", theme: .orange),
        WeeklyNoteCard(title: "Wednesday", theme: .poppy),
        WeeklyNoteCard(title: "Thursday", theme: .teal),
        WeeklyNoteCard(title: "Friday", theme: .teal),
        WeeklyNoteCard(title: "Saturday", theme: .teal),
        WeeklyNoteCard(title: "Sunday", theme: .teal)
    ]
}

struct WeeklyWorkoutCard: View {
    
    let weeks: [WeeklyNoteCard]
    var body: some View {
        List {
            ForEach(weeks) { week in
                NavigationLink(destination: Text(week.title)) {
                    CNCards(week: week)
                }
                .listRowBackground(week.theme.MainColor)
            }
        }.navigationTitle("Weekly Workout")
    }
}

