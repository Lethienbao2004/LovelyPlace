//
//  Event.swift
//  LovelyPlace
//
//  Created by Mark Le on 7/5/20.
//

import Foundation

//
//
//struct Event: Identifiable, Codable, Equatable  {
//    var id = UUID()
//    var title: String
//    var detail: String
//    var date: Date
//}
//
//class Events: ObservableObject {
//    @Published var items: [Event] {
//        didSet {
//            if let encoded = try? JSONEncoder().encode(items){
//                UserDefaults.standard.set(encoded, forKey: "Items")
//            }
//        }
//    }
//    init() {
//        if let items = UserDefaults.standard.data(forKey: "Items") {
//            let decoder = JSONDecoder()
//            if let decoded = try? decoder.decode([Event].self, from: items){
//                self.items = decoded
//                return
//            }
//        }
//        self.items = []
//    }
//
//}
