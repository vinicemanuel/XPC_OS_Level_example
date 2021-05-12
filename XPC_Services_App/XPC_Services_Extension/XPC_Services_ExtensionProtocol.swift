//
//  XPC_Services_ExtensionProtocol.h
//  XPC_Services_Extension
//
//  Created by Vinicius Emanuel on 06/01/21.
//

import Foundation

@objc public protocol XPC_Services_ExtensionProtocol {
    func upercase(_ string: String, withReplay replay: @escaping (String)->Void)
}
