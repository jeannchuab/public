//
//  CombineAppApp.swift
//  CombineApp
//
//  Created by Jeann Luiz on 24/08/23.
//

import SwiftUI

@main
struct CombineAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    run()
                    
                    runWithCombine()
                }
        }
    }
}
