//
//  DaycountView.swift
//  LovelyPlaceWatch Extension
//
//  Created by Mark Le on 9/2/20.
//

import SwiftUI

struct DayCountView: View {
    @ObservedObject var settingInfo = AWSettingInfo()
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(UIColor.black), .accentColor]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.bottom)
            VStack {
                Text("\(settingInfo.dateComponents)")
                    .font(.system(size: 70, weight: .bold, design: .rounded))
                Text("days together")
                    .font(.headline)
//                if settingInfo.info.me.name != "" && settingInfo.info.you.name != ""{
//                    Text(settingInfo.info.me.name + " ♥ " + settingInfo.info.you.name)
//                        .font(.headline)
//                }
            }
        }
       
    }
}
struct DayCountView_Previews: PreviewProvider {
    static var previews: some View {
        DayCountView(settingInfo: AWSettingInfo())
        
    }
}
