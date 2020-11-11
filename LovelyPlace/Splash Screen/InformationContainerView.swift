//
//  InformationContainerView.swift
//  LovelyPlace
//
//  Created by Mark Le on 9/3/20.
//

import SwiftUI

struct InformationContainerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            InformationDetailView(title: "Timeline", subTitle: "Record all your memorable event", imageName: "calendar")
            InformationDetailView(title: "DayCounter", subTitle: "Keep track of how many days you belong together", imageName: "clock")
            InformationDetailView(title: "Widgets", subTitle: "Add the day counter widget to homescreen", imageName: "square.grid.2x2")
        }
        .padding(.horizontal)
    }
}

struct InformationContainerView_Previews: PreviewProvider {
    static var previews: some View {
        InformationContainerView()
    }
}
