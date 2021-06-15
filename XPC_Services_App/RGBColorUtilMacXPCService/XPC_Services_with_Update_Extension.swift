//
//  XPC_Services_with_Update_Extension.swift
//  XPC_Services_with_Update
//
//  Created by Vinicius Emanuel on 07/01/21.
//

import Foundation

fileprivate let semaphore = DispatchSemaphore(value: 2)

class XPC_Services_with_Update_Extension: XPC_Services_with_Update_ExtensionProtocol {
    
    var listener: ListenerDataProtocol?
    
    func startRandonColor(id: String) {
        
        let second = 1000000
        
        DispatchQueue.global(qos: .utility).async {
            
            semaphore.wait()
            try? writeString(string: "ID: \(id) start process")
            //        DispatchQueue.main.async {
            var number = 0
            while(number < 10) {
                let red = Float(Int.random(in: 0...100))
                let blue = Float(Int.random(in: 0...100))
                let green = Float(Int.random(in: 0...100))
                let color = MyRGBColor(red: red/100, green: green/100, blue: blue/100)
                try? writeString(string: "red:\(red) green:\(green) blue:\(blue) ID: \(id), number: \(number)")
                self.sendNotificationProgress(red: red, green: green, blue: blue, id: id)
                self.listener?.sendRGBColor(color: color)
                usleep(useconds_t(second))
                number = number + 1
            }
            
            try? writeString(string: "ID: \(id) end process")
            semaphore.signal()
        }
    }
    
    private func sendNotificationProgress(red: Float, green: Float, blue: Float, id: String) {
        let dictionary: [String : String] = ["red":   "\(red)",
                                             "green": "\(green)",
                                             "blue":  "\(blue)",
                                             "notificationID": id]
        
        CFNotificationCenterPostNotification(CFNotificationCenterGetDistributedCenter(),
                                             CFNotificationName("ColorsNotification" as CFString),
                                             nil,
                                             dictionary as CFDictionary,
                                             true)
    }
}
