//
//  Modifier.swift
//  LovelyPlace
//
//  Created by Mark Le on 9/3/20.
//

import Foundation
import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.headline)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(Color.accentColor))
            .padding(.bottom)
            
    }
}
extension View {
    func customButton() -> ModifiedContent<Self, ButtonModifier> {
        return modifier(ButtonModifier())
    }
}

extension Text {
    func customTitleText() -> Text {
        self
            
            .fontWeight(.black)
            .font(.system(size: 36))
            .font(.headline)
        
    }
    
}
