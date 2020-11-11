//
//  TitleView.swift
//  LovelyPlace
//
//  Created by Mark Le on 9/3/20.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack {
            Text("Welcome to")
                .customTitleText()
            Text("LovelyPlace")
                .customTitleText()
                .foregroundColor(.accentColor)
        }
    
    }
}
struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
