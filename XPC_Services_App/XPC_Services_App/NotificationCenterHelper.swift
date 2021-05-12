//
//  NotificationCenterHelper.swift
//  XPC_OS_Services_App
//
//  Created by Vinicius Emanuel on 12/05/21.
//

import XPCFramework
import Foundation

class NotificationCenterHelper {
    static let shared = NotificationCenterHelper()
    
    private init() { }
    
    private var replay: ((MyRGBColor)->Void)? = nil
    
    func startObserve(replay: @escaping (MyRGBColor)->Void) {
        self.replay = replay
        NotificationCenter.default.addObserver(self, selector: #selector(self.receivedFinishLocalNotification(notification:)), name: Notification.Name("ColorsNotification"), object: nil)
    }
    
    @objc private func receivedFinishLocalNotification(notification: Notification) {
        if let dictionary = notification.userInfo as? [String: String] {
            
            let formater = NumberFormatter()
            formater.decimalSeparator = "."
            
            let redString = dictionary["red"] ?? ""
            let greenString = dictionary["green"] ?? ""
            let blueString = dictionary["blue"] ?? ""
            
            let red = formater.number(from: redString)?.floatValue ?? 0
            let green = formater.number(from: greenString)?.floatValue ?? 0
            let blue = formater.number(from: blueString)?.floatValue ?? 0
            
            replay?(MyRGBColor(red: red/100, green: green/100, blue: blue/100))
            
            print(dictionary)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
