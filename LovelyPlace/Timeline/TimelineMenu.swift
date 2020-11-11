//
//  TimelineMenu.swift
//  LovelyPlace
//
//  Created by Mark Le on 8/17/20.
//

import SwiftUI

struct TimelineMenu: View {
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif
    @ViewBuilder var body: some View {
        #if os(iOS)
        if horizontalSizeClass == .compact {
            TimelineView()
                //.listStyle(GroupedListStyle())
        } else {
            TimelineView()
                //.listStyle(DefaultListStyle())
                
        }
        #else
        TimelineView()
            //.listStyle(SidebarListStyle())
        #endif
    }}

struct TimelineMenu_Previews: PreviewProvider {
    static var previews: some View {
        TimelineMenu()
    }
}
