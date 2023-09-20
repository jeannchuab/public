//
//  BooksApp.swift
//  Books
//
//  Created by Jeann Luiz on 18/09/23.
//

import SwiftUI

@main
struct BooksApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            
            // Injecting the managedObjectContext on the environment
            // managedObjectContext is the live version of the database in memory.
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
