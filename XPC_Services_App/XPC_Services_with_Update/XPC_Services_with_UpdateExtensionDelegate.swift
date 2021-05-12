//
//  XPC_Services_with_UpdateExtensionDelegate.swift
//  XPC_Services_with_Update
//
//  Created by Vinicius Emanuel on 07/01/21.
//

import Foundation

class XPC_Services_with_UpdateExtensionDelegate: NSObject, NSXPCListenerDelegate {
    
    func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
        
        newConnection.exportedInterface = NSXPCInterface(with: XPC_Services_with_Update_ExtensionProcol.self)
        newConnection.exportedObject = XPC_Services_with_Update_Extension()
        
        newConnection.remoteObjectInterface = NSXPCInterface(with: ListenerDataProtocol.self)
        (newConnection.exportedObject as? XPC_Services_with_Update_Extension)?.listener = newConnection.remoteObjectProxy as? ListenerDataProtocol
        
        newConnection.resume()
        
        return true
    }
}
