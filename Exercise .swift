//
//  Exercise .swift
//  GymSpot
//
//  Created by Dhruv Patel on 3/24/22.
//

import SwiftUI
import CoreData


struct ExerciseMethod: View {
    
    @Environment(\.managedObjectContext) private var ViewContext
    @State var ShowExerciseSheet = false
    @FetchRequest(
        entity: ExercisesDM.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \ExercisesDM.name, ascending: false )]
    )
    var Entries: FetchedResults<ExercisesDM>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Entries) { entry in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(entry.name) - \(entry.musclegroup) ex").font(.headline)
                            Spacer()
                        }.padding()
                    }.frame(height: 100)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Exercises")
            .navigationBarItems(trailing: Button(action: {
                    ShowExerciseSheet = true
                }, label: {
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                }))
            .sheet(isPresented: $ShowExerciseSheet) {
                NewExerciseEntry()
            }
        }
    }
}


// Data Entry
struct NewExerciseEntry: View {
    let MuscleTypes = [
        "Chest",
        "Back",
        "Shoulders",
        "Legs",
        "Abs",
        "Triceps",
        "Biceps"
    ]
    
    @Environment(\.managedObjectContext) private var ViewContext
    @Environment(\.presentationMode) var PresentationMode
    
    @State var SelectMuscleTypeIndex = 1
    @State var SetCount: Int16 = 1
    @State var RepCount: Int16 = 1
    @State var ExerciseName = ""
    @State var Equipment = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Exercise Name", text: $ExerciseName).keyboardType(.default)
                Section(header: Text("Muscle Group")) {
                    Picker(
                        selection: $SelectMuscleTypeIndex,
                        label: Text("Muscle Group")
                    ) {
                        ForEach(0 ..< MuscleTypes.count) {
                            Text(self.MuscleTypes[$0]).tag($0)
                        }
                    }
                }
                Stepper("\(SetCount) Sets", value: $SetCount, in: 1...100)
                Stepper("\(RepCount) Reps", value: $RepCount, in: 1...100)
                
                Button(action: {
                    guard self.ExerciseName != "" else {return}
                    
                    let NewEntry = ExercisesDM(context: ViewContext)
                    NewEntry.name = self.ExerciseName
                    NewEntry.musclegroup = self.MuscleTypes[self.SelectMuscleTypeIndex]
                    // NewEntry.equiment = self.Equipment
                    NewEntry.reps = self.RepCount
                    NewEntry.sets = self.SetCount
                    
                    do {
                        try ViewContext.save()
                        print("Entry saved.")
                        PresentationMode.wrappedValue.dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }) {
                    Text("New Entry")
                }
            }
        }
    }
}
