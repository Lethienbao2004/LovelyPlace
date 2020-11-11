//
//  BezelGraphicCircularView.swift
//  LovelyPlaceWatch Extension
//
//  Created by Mark Le on 9/7/20.
//

import SwiftUI
import ClockKit

struct BezelGraphicCircularView: View {
    @ObservedObject var settingInfo = AWSettingInfo()
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(UIColor.black), .accentColor]), startPoint: .top, endPoint: .bottom)
            VStack {
                Text("\(settingInfo.dateComponents)")
                Text("days")
            }
        }
    }
}

struct BezelGraphicCircularView_Previews: PreviewProvider {
    static var previews: some View {
        CLKComplicationTemplateGraphicCircularView(BezelGraphicCircularView())
            .previewContext()
    }
}
