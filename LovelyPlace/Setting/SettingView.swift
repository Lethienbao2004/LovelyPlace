//
//  SettingView.swift
//  LovelyPlace
//
//  Created by Mark Le on 8/15/20.
//

import SwiftUI

struct SettingView: View {
    @ObservedObject var settingInfo: UserData
    
    
    var body: some View {
        List {
            DatePicker("First met day", selection: $settingInfo.info.dateFirstMet, in: ...Date(), displayedComponents: .date)
            NavigationLink("Edit Profile" , destination: EditProfileView(settingInfo: settingInfo))
            Button(action: {
                settingInfo.info.isFirstTime = true
            }, label: {
                Text("Trigger Splash Screen")
            })
            
        }
        .navigationTitle("Setting")
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(settingInfo: UserData())
    }
}
