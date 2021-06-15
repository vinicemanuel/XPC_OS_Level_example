//
//  main.swift
//  RGBColorUtilMacXPCService
//
//  Created by Vinicius Emanuel on 12/05/21.
//

import Foundation

let listener = NSXPCListener(machServiceName: "br.com.RGBColorUtilMacXPCService")
let delegate = XPC_Services_with_UpdateExtensionDelegate()
listener.delegate = delegate
listener.resume()
RunLoop.main.run()

func writeString(string: String) throws {
let data = (string + "\n").data(using: .utf8)!
let fileURL = URL(string: "/Users/viniciusemanuel/Desktop/coisas/mycommand.out")!

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
