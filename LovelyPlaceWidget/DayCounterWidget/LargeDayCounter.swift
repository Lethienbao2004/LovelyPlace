//
//  LargeDayCounter.swift
//  LovelyPlace
//
//  Created by Mark Le on 8/22/20.
//

import SwiftUI
import WidgetKit

struct LargeDayCounter: View {
    @ObservedObject var settingInfo: UserData
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.systemGray5), .accentColor]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("We have been together for")
                    .font(.headline)
                Text("\(settingInfo.dateComponents)")
                    .font(.system(size: 110, weight: .bold, design: .rounded))
                Text("days")
                    .font(.headline)
                if settingInfo.info.me.name != "" && settingInfo.info.you.name != ""{
                    Text(settingInfo.info.me.name + " ♥ " + settingInfo.info.you.name)
                        .font(.headline)
                }
            }
        }
        .widgetURL(URL(string: "my-url-scheme://daycounter/")!)
        .accentColor(Color("AccentColor"))
    }
}

struct LargeDayCounter_Previews: PreviewProvider {
    static var previews: some View {
        LargeDayCounter(settingInfo: UserData())
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
