//
//  XPC_Services_with_Update_Extension.swift
//  XPC_Services_with_Update
//
//  Created by Vinicius Emanuel on 07/01/21.
//

import Foundation

class XPC_Services_with_Update_Extension: XPC_Services_with_Update_ExtensionProtocol {
    
    var listener: ListenerDataProtocol?
    
    func startRandonColor() {
        print("start")
        
        let second = 1000000
        
        DispatchQueue.main.async { [weak self] in
            while(true) {
                let red = Float(Int.random(in: 0...100))
                let blue = Float(Int.random(in: 0...100))
                let green = Float(Int.random(in: 0...100))
                let color = MyRGBColor(red: red/100, green: green/100, blue: blue/100)
                self?.listener?.sendRGBColor(color: color)
                usleep(useconds_t(second/3))
            }
        }
    }
}
