//
//  XPC_Services_with_Update_ExtensionProcol.swift
//  XPC_Services_with_Update
//
//  Created by Vinicius Emanuel on 07/01/21.
//

import Foundation

//protocol to start the job
@objc public protocol XPC_Services_with_Update_ExtensionProcol {
    func startRandonColor()
}

//protocol to be implemented for hwo will will get the data
@objc(ListenerDataProtocol) public protocol ListenerDataProtocol {
    func sendRGBColor(color: MyRGBColor)
}
