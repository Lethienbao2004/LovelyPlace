//
//  AWSettingInfo.swift
//  LovelyPlaceWatch Extension
//
//  Created by Mark Le on 9/2/20.
//

import Foundation
import WatchConnectivity
import ClockKit

class AWSettingInfo: NSObject, ObservableObject, WCSessionDelegate {
    
    static let shared = AWSettingInfo()
    
    @Published var dateComponents: Int = 0 {
        didSet{
            guard let userDefaults = UserDefaults(suiteName: "group.markle.LovelyPlace") else {fatalError()}
            userDefaults.setValue(dateComponents, forKey: "dateComponents")
        }
    }
    
    override init() {
        if WCSession.isSupported() {
            super.init()
            let session = WCSession.default
            session.delegate = self
            session.activate()
        } else {super.init()}
        guard let userDefaults = UserDefaults(suiteName: "group.markle.LovelyPlace") else {fatalError()}
        dateComponents = userDefaults.integer(forKey: "dateComponents")
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // code
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print(message)
        guard let date = message["date"] as? Int else {return}
        DispatchQueue.main.async {
            self.dateComponents = date
        }
        
    }
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        print(userInfo)
        guard let date = userInfo["date"] as? Int else {return}
        DispatchQueue.main.async {
            self.dateComponents = date
        }
        
    }
}
