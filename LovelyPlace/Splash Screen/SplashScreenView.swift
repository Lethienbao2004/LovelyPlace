//
//  SplashScreenView.swift
//  LovelyPlace
//
//  Created by Mark Le on 8/22/20.
//

import SwiftUI

struct SplashScreenView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
//        ScrollView {
            VStack(alignment: .center) {
                Spacer()
                TitleView()
                InformationContainerView()
                Spacer()//minLength: 30)
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Continue")
                        .padding()
                        .customButton()
                        
                }
                .padding(.horizontal)
            }
        //}
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
