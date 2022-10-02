//
//  BindingOptional.swift
//  SidebarTabbarTest
//
//  Created by Mark Le on 10/2/22.
//

import Foundation
import SwiftUI

extension Binding where Value == TabIdentifier? {
    func unwrapBinding(_ fallback: TabIdentifier) -> Binding<TabIdentifier> {
        return Binding<TabIdentifier>(get: {
            return self.wrappedValue ?? fallback
        }) { value in
            self.wrappedValue = value
        }
    }
}
