//
//  RectangularDayCounter.swift
//  LovelyPlace
//
//  Created by Mark Le on 9/29/22.
//

import SwiftUI
import WidgetKit

struct RectangularDayCounter: View {
    @ObservedObject var settingInfo: DataController

    var body: some View {
        if settingInfo.info.me.name != "" && settingInfo.info.you.name != ""{
            Text(settingInfo.info.me.name + " ♥ " + settingInfo.info.you.name)
                .font(.headline)
        }
        Text("\(settingInfo.dateComponents) days together")
        
    }
}

struct RectangularDayCounter_Previews: PreviewProvider {
    static var previews: some View {
        RectangularDayCounter(settingInfo: DataController())
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}
