//
//  MainActivity.swift
//  GymSpot
//
//  Created by Dhruv Patel on 3/23/22.
//

import Foundation
import SwiftUI


struct MainActivityCard: Identifiable {
    let id: UUID
    var title: String
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, theme: Theme) {
        self.id = id
        self.title = title
        self.theme = theme
    }
}

extension MainActivityCard {
    static let MAView: [MainActivityCard] = [
        MainActivityCard(title: "Begin Workout", theme: .poppy),
        MainActivityCard(title: "Weekly Schedule", theme: .yellow),
        MainActivityCard(title: "Exercises", theme: .teal)
    ]
}

// Card View
struct MainCards: View {
    let mlist: MainActivityCard
    var body: some View {
        VStack (alignment: .leading) {
            Text(mlist.title).font(.headline)
            Spacer()
        }.padding().foregroundColor(mlist.theme.AccentColor)
    }
}

struct MainActivityActions: View {
    let actions: [MainActivityCard]
    var body: some View {
        List {
            ForEach(actions) {
                action in
                if action.title == "Begin Workout" {
                    //NavigationLink(destination: WeeklyWorkoutCard(weeks: WeeklyNoteCard.WView)) {
                    //    MainCards(mlist: action)
                    //}.navigationTitle("Hey There!")
                }
                if action.title == "Weekly Schedule" {
                    NavigationLink(destination: WeeklyWorkoutCard(weeks: WeeklyNoteCard.WView)) {
                        MainCards(mlist: action)
                    }
                }
               if action.title == "Exercises" {
                   VStack (alignment: .leading) {
                       Text("Exercises").font(.headline)
                       NavigationLink(destination:
                                        ExerciseMethod()) {
                            // NewExerciseEntry(ViewContext)
                        }
                   }
                }
            }
        }
    }
}
