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
        
        DispatchQueue.main.async {
            while(true) {
                let red = Float(Int.random(in: 0...100))
                let blue = Float(Int.random(in: 0...100))
                let green = Float(Int.random(in: 0...100))
                let color = MyRGBColor(red: red/100, green: green/100, blue: blue/100)
                try? self.writeString(stirng: "red:\(red) green:\(green) blue:\(blue)")
                self.listener?.sendRGBColor(color: color)
                usleep(useconds_t(second))
            }
        }
    }
    
    func writeString(stirng: String) throws {
        let data = (stirng + "\n").data(using: .utf8)!
        let fileURL = URL(string: "/Users/viniciusemanuel/Desktop/colors_mycommand.out")!
        
             if let fileHandle = FileHandle(forWritingAtPath: fileURL.path) {
                 defer {
                     fileHandle.closeFile()
                 }
                 fileHandle.seekToEndOfFile()
                fileHandle.write(data)
             }
             else {
                try data.write(to: fileURL)
             }
         }
}
