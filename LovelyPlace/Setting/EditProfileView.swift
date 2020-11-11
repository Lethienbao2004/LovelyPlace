//
//  SetPeopleView.swift
//  LovelyPlace
//
//  Created by Mark Le on 8/24/20.
//

import SwiftUI

struct EditProfileView: View {
    @ObservedObject var settingInfo: UserData
    var body: some View {
        List{
            PeopleApperanceView(people: $settingInfo.info.me)
            PeopleApperanceView(people: $settingInfo.info.you)
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(settingInfo: UserData())
    }
}
