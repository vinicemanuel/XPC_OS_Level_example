
//
//  Created by Vinicius Emanuel on 06/01/21.
//

import Foundation

class XPC_Services_ExtensionDelegate: NSObject, NSXPCListenerDelegate {
    func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
        
        newConnection.exportedInterface = NSXPCInterface(with: XPC_Services_ExtensionProtocol.self)
        newConnection.exportedObject = XPC_Services_Extension()
        
        newConnection.resume()
        
        return true
    }
}
