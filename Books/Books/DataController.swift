//
//  DataController.swift
//  Books
//
//  Created by Jeann Luiz on 18/09/23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Books")
    
    // Loading the data from CoreData
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }            
        }
    }
}
