//
//  CommonView.swift
//  AppClipsExample
//
//  Created by Jeann Luiz on 19/09/23.
//

import SwiftUI

struct CommonView: View {
    var body: some View {
        
        #if APPCLIP
            Text("This is a Common View for the AppClip")
        #else
            Text("This is a Common View for the Full App")
        #endif
    }
}

struct CommonView_Previews: PreviewProvider {
    static var previews: some View {
        CommonView()
    }
}
