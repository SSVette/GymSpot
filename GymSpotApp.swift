//
//  GymSpotApp.swift
//  GymSpot
//
//  Created by Dhruv Patel on 3/22/22.
//

import SwiftUI

@main
struct GymSpotApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainActivityActions(actions: MainActivityCard.MAView)
               //     .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
