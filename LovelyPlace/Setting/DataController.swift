//
//  SettingInfo.swift
//  LovelyPlace
//
//  Created by Mark Le on 8/18/20.
//

import Foundation
import WatchConnectivity
import WidgetKit
import CloudKit

enum Position: String, Codable {
    case me = "me"
    case you = "you"
}
struct People: Codable {
    var name: String
    var position: Position
}
struct Property: Codable {
    var dateFirstMet: Date
    var isFirstTime = true
    var me: People
    var you: People
}
class DataController: NSObject, ObservableObject, WCSessionDelegate {
    //MARK: - Calculate Date
    
    @Published var currentSideBarPage: TabIdentifier? = .timeline {
        didSet{
            guard let page = currentSideBarPage else {return}
            if currentSideBarPage != currentTabBarPage {
                currentTabBarPage = page
            }
        }
    }
    @Published var currentTabBarPage: TabIdentifier = .timeline {
        didSet{
            if currentSideBarPage != currentTabBarPage {
                currentSideBarPage = currentTabBarPage
            }
        }
            
    }
    
    
    
    @Published var dateComponents: Int = 0 {
        didSet {
            sendMessage(message: ["date": dateComponents])
            #if DEBUG
                print(dateComponents)
            #endif
        }
    }
    @Published var info = Property(dateFirstMet: Date(), me: People(name: "", position: .me), you: People(name: "", position: .you)) {
        didSet {
            guard let userDefaults = UserDefaults(suiteName: "group.markle.LovelyPlace") else {return}
            if let encoded = try? JSONEncoder().encode(info) {
                userDefaults.setValue(encoded, forKey: "Info")
                
            }
            calculateDate(firstMet: info.dateFirstMet)
            
            WidgetCenter.shared.reloadTimelines(ofKind: "LovelyPlaceWidget")
        }
    }
    
    override init() {
        super.init()
        setUpTimer()
        activateSession()
        guard let userDefaults = UserDefaults(suiteName: "group.markle.LovelyPlace") else {fatalError()}
        if let data = userDefaults.data(forKey: "Info") {
            if let decoded = try? JSONDecoder().decode(Property.self, from: data) {
                info = decoded
                calculateDate(firstMet: decoded.dateFirstMet)
                sendMessage(message: ["date": dateComponents])
                return
            }
        }
        
    }
    
    func calculateDate(firstMet: Date)  {
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: firstMet)
        let date2 = calendar.startOfDay(for: Date())
        dateComponents = calendar.dateComponents([.day], from: date1, to: date2).day ?? 0
        
    }
    @objc func updateDayView() {
        calculateDate(firstMet: info.dateFirstMet)
        setUpTimer()
    }
    func setUpTimer() {
        //guard let abc = Calendar.current.date(byAdding: .day, value: 1, to: Date()) else { fatalError("here") }
        let futureDate = Calendar.current.startOfDay(for: Calendar.current.date(byAdding: .day, value: 1, to: Date())!)
        let timer = Timer(fireAt: futureDate, interval: 0, target: self, selector: #selector(updateDayView), userInfo: nil, repeats: false)
        RunLoop.main.add(timer, forMode: .common)
    }
    
    
    //MARK: - WatchConnectivity
    private let session: WCSession = .default
    func activateSession() {
        if WCSession.isSupported() {
            session.delegate = self
            session.activate()
        }
    }
    func sendMessage(message: [String: Any]) {
        if WCSession.isSupported() {
//            session.sendMessage(message, replyHandler: nil){ error in
//                print(error.localizedDescription)
//                self.sendMessage(message: message)
//            }
            session.transferUserInfo(message)
            
        }
    }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        //code
    }

    func sessionDidBecomeInactive(_ session: WCSession) {
        //code
    }

    func sessionDidDeactivate(_ session: WCSession) {
        //code
    }
    
    //MARK: - AW Complication Data
    func getDateComponents(date: Date) -> Int {
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: info.dateFirstMet)
        let date2 = calendar.startOfDay(for: Date())
        return calendar.dateComponents([.day], from: date1, to: date2).day ?? 0
    }
    
    
    
    

}
