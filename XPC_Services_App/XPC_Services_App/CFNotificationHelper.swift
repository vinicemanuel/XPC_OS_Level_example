//
//  CFNotificationHelper.swift
//  Wave
//
//  Created by Vinicius Emanuel on 10/05/21.
//  Copyright © 2021 Zian Zhou. All rights reserved.

import Foundation
import CoreFoundation

class CFNotificationHelper: NSObject  {
    @objc static public let shared = CFNotificationHelper()
    
    private override init() {

    }
    
    @objc public func startObservers() {
        
        CFNotificationCenterAddObserver(CFNotificationCenterGetDistributedCenter(),
                                        nil,
                                        { (_, _, _, _, userInfo) in
                                            if let dictionary = userInfo as? [String: String]{
                                                NotificationCenter.default.post(name: Notification.Name("ColorsNotification"), object: nil, userInfo: dictionary)
                                            }
                                        },
                                        "ColorsNotification" as CFString,
                                        nil,
                                        .deliverImmediately)
    }
    
    deinit {
        CFNotificationCenterRemoveObserver(CFNotificationCenterGetDistributedCenter(), nil, CFNotificationName("ColorsNotification" as CFString), nil)
    }
}
