//
//  TabIdentifier.swift
//  LovelyPlace
//
//  Created by Mark Le on 8/22/20.
//

import Foundation
enum TabIdentifier: Hashable {
  case timeline, daycounter, settings
}

extension URL {
  var isDeeplink: Bool {
    return scheme == "my-url-scheme" // matches my-url-scheme://<rest-of-the-url>
  }

  var tabIdentifier: TabIdentifier? {
    guard isDeeplink else { return nil }

    switch host {
    case "tiemline": return .timeline // matches my-url-scheme://home/
    case "settings": return .settings // matches my-url-scheme://settings/
    case "daycounter": return .daycounter
    default: return nil
    }
  }
}
