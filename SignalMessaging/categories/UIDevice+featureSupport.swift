//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
//

import Foundation

@objc
public extension UIDevice {
    var supportsCallKit: Bool {
        return ProcessInfo().isOperatingSystemAtLeast(OperatingSystemVersion(majorVersion: 10, minorVersion: 0, patchVersion: 0))
    }

    @objc
    public var isIPhoneX: Bool {
        switch UIScreen.main.nativeBounds.height {
        case 1136:
            // iPhone 5 or 5S or 5C
            return false
        case 1334:
            // iPhone 6/6S/7/8
            return false
        case 1920, 2208:
            // iPhone 6+/6S+/7+/8+//
            return false
        case 2436:
            return true
        default:
            // Verify all our IOS_DEVICE_CONSTANT tags make sense when adding a new device size.
            owsFail("\(logTag) in \(#function) unknown device format")
            return false
        }
    }
}
