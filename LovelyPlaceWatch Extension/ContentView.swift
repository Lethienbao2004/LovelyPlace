//
//  ContentView.swift
//  LovelyPlaceWatch Extension
//
//  Created by Mark Le on 8/29/20.
//

import SwiftUI

struct ContentView: View {
    let data = AWSettingInfo.shared
    var body: some View {
        DayCountView()
            .environmentObject(data)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
