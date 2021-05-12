//
//  XPC_Services_Extension.m
//  XPC_Services_Extension
//
//  Created by Vinicius Emanuel on 06/01/21.
//

import Foundation

class XPC_Services_Extension: XPC_Services_ExtensionProtocol {
    
    func upercase(_ string: String, withReplay replay: @escaping (String) -> Void) {
        replay(string.uppercased())
    }
    
}
