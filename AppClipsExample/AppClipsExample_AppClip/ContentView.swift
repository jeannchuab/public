//
//  ContentView.swift
//  AppClipsExample_AppClip
//
//  Created by Jeann Luiz on 19/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("Hello, world App Clip!")
                .padding()
            
            CommonView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
