//
//  PeopleApperanceView.swift
//  LovelyPlace
//
//  Created by Mark Le on 8/24/20.
//

import SwiftUI

struct PeopleApperanceView: View {
    @Binding var people: People
    var body: some View {
        
        TextField(people.position.rawValue, text: $people.name)
    }
}

struct PeopleApperanceView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleApperanceView(people: .constant(People(name: "Haaa", position: Position.you)))
    }
}
