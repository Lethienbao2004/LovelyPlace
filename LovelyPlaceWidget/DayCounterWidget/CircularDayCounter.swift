//
//  CircularDayCounter.swift
//  LovelyPlace
//
//  Created by Mark Le on 9/29/22.
//

import SwiftUI
import WidgetKit

struct CircularDayCounter: View {
    @ObservedObject var settingInfo: DataController
    
    var body: some View {
        VStack {
            Text("\(settingInfo.dateComponents)")
            Text("days")
        }
    }
}

struct CircularDayCounter_Previews: PreviewProvider {
    static var previews: some View {
        CircularDayCounter(settingInfo: DataController())
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
    }
}
