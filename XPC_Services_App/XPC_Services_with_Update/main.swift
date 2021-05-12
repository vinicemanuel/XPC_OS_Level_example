
//
//  Created by Vinicius Emanuel on 07/01/21.
//

import Foundation

let delegate = XPC_Services_with_UpdateExtensionDelegate()
let listener = NSXPCListener.service()
listener.delegate = delegate
listener.resume()
