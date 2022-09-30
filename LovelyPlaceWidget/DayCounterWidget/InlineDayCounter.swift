//
//  InlineDayCounter.swift
//  LovelyPlace
//
//  Created by Mark Le on 9/29/22.
//

import SwiftUI
import WidgetKit

struct InlineDayCounter: View {
    @ObservedObject var settingInfo: DataController
    
    var body: some View {
        Text("\(settingInfo.dateComponents) days together")
    }
}

struct InlineDayCounter_Previews: PreviewProvider {
    static var previews: some View {
        InlineDayCounter(settingInfo: DataController())
            .previewContext(WidgetPreviewContext(family: .accessoryInline))
    }
}
