//
//  ContentView.swift
//  Books
//
//  Created by Jeann Luiz on 18/09/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObject
//    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
//            List(students) { student in
//                Text(student.name ?? "Unknown")
//            }
            
//            Button("Add") {
//                let firstNames = ["John", "Michael", "Harry", "Lana", "Bob", "David"]
//                let lastNames = ["Wick", "Schumacher", "Potter", "Del Rey", "Sponge", "Jordan", "Guetta"]
//
//                let chosenFirstName = firstNames.randomElement()
//                let chosenLastName = firstNames.randomElement()
//
//                let student = Student(context: managedObject)
//                student.id = UUID()
//                student.name = "\(chosenFirstName ?? "") \(chosenLastName ?? "")"
//
//                try? managedObject.save()
//            }
                        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
