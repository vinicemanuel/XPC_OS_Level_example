//
//  XPC_Services_with_Update_Extension.swift
//  XPC_Services_with_Update
//
//  Created by Vinicius Emanuel on 07/01/21.
//

import Foundation

class XPC_Services_with_Update_Extension: XPC_Services_with_Update_ExtensionProtocol {
    
    var listener: ListenerDataProtocol?
    
    let notificationID = UUID().uuidString
    
    func startRandonColor() {
        print("start")
        
        let second = 1000000
        
        DispatchQueue.global(qos: .utility).async {
            var number = 0
            while(number < 20) {
                let red = Float(Int.random(in: 0...100))
                let blue = Float(Int.random(in: 0...100))
                let green = Float(Int.random(in: 0...100))
                let color = MyRGBColor(red: red/100, green: green/100, blue: blue/100)
//                try? self.writeString(stirng: "red:\(red) green:\(green) blue:\(blue) ID: \(self.notificationID), number: \(number)")
                self.sendNotificationProgress(red: red, green: green, blue: blue)
                self.listener?.sendRGBColor(color: color)
                usleep(useconds_t(second))
                number = number + 1
            }
        }
    }
    
    private func sendNotificationProgress(red: Float, green: Float, blue: Float) {
        let dictionary: [String : String] = ["red":   "\(red)",
                                             "green": "\(green)",
                                             "blue":  "\(blue)",
                                             "notificationID": notificationID]
        
        CFNotificationCenterPostNotification(CFNotificationCenterGetDistributedCenter(),
                                             CFNotificationName("ColorsNotification" as CFString),
                                             nil,
                                             dictionary as CFDictionary,
                                             true)
    }
}
