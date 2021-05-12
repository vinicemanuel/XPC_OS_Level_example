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


