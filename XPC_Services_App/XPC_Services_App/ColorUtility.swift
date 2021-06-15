//
//  ColorUtility.swift
//  XPC_Services_App
//
//  Created by Vinicius Emanuel on 07/01/21.
//

import Foundation
import SwiftUI
import XPCFramework

class ColorUtility {
    
    var completion: ((MyRGBColor)->Void)?
    
    func randonColor(id: String, replay: @escaping (MyRGBColor)->Void) {
        let connection = NSXPCConnection(machServiceName: "br.com.RGBColorUtilMacXPCService")
        connection.remoteObjectInterface = NSXPCInterface(with: XPC_Services_with_Update_ExtensionProtocol.self)
        
        connection.exportedInterface = NSXPCInterface(with: ListenerDataProtocol.self)
        connection.exportedObject = self
        
        connection.resume()
        
        let service = connection.remoteObjectProxyWithErrorHandler { (error) in
            print("connection error: ", error.localizedDescription)
        } as? XPC_Services_with_Update_ExtensionProtocol
        
        self.completion = replay
        
        service?.startRandonColor(id: id)
    }
}

extension ColorUtility: ListenerDataProtocol {
    func sendRGBColor(color: MyRGBColor) {
        if let completion = self.completion {
            completion(color)
        }
    }
}
