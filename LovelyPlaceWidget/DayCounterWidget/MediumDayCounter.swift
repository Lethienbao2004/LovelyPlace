//
//  MediumDayCounter.swift
//  LovelyPlace
//
//  Created by Mark Le on 8/22/20.
//

import SwiftUI
import WidgetKit

struct MediumDayCounter: View {
    @ObservedObject var settingInfo: DataController
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.systemGray5), .accentColor]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack {
                    Text("\(self.settingInfo.dateComponents)")
                        .font(.system(size: 80, weight: .bold, design: .rounded))
                    VStack{
                        Text("days")
                            .font(.headline)
                        Text("together")
                            .font(.headline)
                    }
                }
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

struct MediumDayCounter_Previews: PreviewProvider {
    static var previews: some View {
        MediumDayCounter(settingInfo: DataController())
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
