//
//  DayCountView.swift
//  LovelyPlace
//
//  Created by Mark Le on 8/13/20.
//

import SwiftUI

struct DayCountView: View {
    @ObservedObject var settingInfo: DataController //{
//        didSet {
//            countedDate = calculateDate()
//        }
//    }
//    @State var countedDate: DateComponents = calculateDate()
//    static var calculateDate: DateComponents {
//        let calendar = Calendar.current
//        let date1 = calendar.startOfDay(for: settingInfo.info.dateFirstMet)
//        let date2 = calendar.startOfDay(for: Date())
//        return calendar.dateComponents([.day], from: date1, to: date2) ??
//    }
    @State private var backgroundColor = background
    static var background: UIColor {
        #if os(watchOS)
            return UIColor.black
        #else
            return UIColor.systemGray5
        #endif
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(backgroundColor), .accentColor]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("We have been together for")
                    .font(.headline)
                Text("\(self.settingInfo.dateComponents)")
                    .font(.system(size: 150, weight: .bold, design: .rounded))
                Text("days")
                    .font(.headline)
            }
        }
       //.onAppear(perform: calculateDate)
    }
//    func calculateDate() -> DateComponents {
//        //countedDate = Date().timeIntervalSince(settingInfo.info.dateFirstMet)/3
//        let calendar = Calendar.current
//        let date1 = calendar.startOfDay(for: settingInfo.info.dateFirstMet)
//        let date2 = calendar.startOfDay(for: Date())
//        return calendar.dateComponents([.day], from: date1, to: date2)
//
//    }
}

struct DayCountView_Previews: PreviewProvider {
    static var previews: some View {
        DayCountView(settingInfo: DataController())
        
    }
}
