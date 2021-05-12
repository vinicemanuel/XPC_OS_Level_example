
//
//  Created by Vinicius Emanuel on 06/01/21.
//

import Foundation

let delegate = XPC_Services_ExtensionDelegate()
let listener = NSXPCListener.service()
listener.delegate = delegate
listener.resume()
