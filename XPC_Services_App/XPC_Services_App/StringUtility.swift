//
//  StringUtility.swift
//  XPC_Services_App
//
//  Created by Vinicius Emanuel on 07/01/21.
//

import Foundation
import XPC_Services_Extension

class StringUtility {
    func upercase(_ string: String, withReplay replay: @escaping (String)->Void) {
        let connection = NSXPCConnection(serviceName: "Lication.XPC-Services-Extension")
        connection.remoteObjectInterface = NSXPCInterface(with: XPC_Services_ExtensionProtocol.self)
        connection.resume()
        
        let service = connection.remoteObjectProxyWithErrorHandler { (error) in
            print("connection error: ", error.localizedDescription)
        } as? XPC_Services_ExtensionProtocol
        
        service?.upercase(string, withReplay: replay)
    }
}
