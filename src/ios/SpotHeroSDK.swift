import Foundation
import SpotHero_iOS_Partner_SDK

@objc(SpotHeroSDK) class SpotHeroSDK : CDVPlugin {
    func startup(command: CDVInvokedUrlCommand) {
        let spotHeroSDK = SpotHeroPartnerSDK.shared
        guard let key = command.arguments[0] as? String else {
            return
        }

        spotHeroSDK.partnerApplicationKey = key

        if let tintColor = command.arguments[1] as? String {
            spotHeroSDK.tintColor = UIColor(hex: tintColor)
        }

        if let textColor = command.arguments[2] as? String {
            spotHeroSDK.textColor = UIColor(hex: textColor)
        }

        spotHeroSDK.launchSDKFromViewController(self.viewController)

        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)

        self.commandDelegate.send(pluginResult, callbackId:command.callbackId)
    }
}

public extension UIColor {
    convenience init(hex string: String) {
        var hex = string.hasPrefix("#")
            ? String(string.characters.dropFirst())
            : string
        
        guard hex.characters.count == 3 || hex.characters.count == 6
            else {
                self.init(white: 1.0, alpha: 0.0)
                return
        }
        
        if hex.characters.count == 3 {
            for (index, char) in hex.characters.enumerated() {
                hex.insert(char, at: hex.index(hex.startIndex, offsetBy: index * 2))
            }
        }
        
        self.init(
            red:   CGFloat((Int(hex, radix: 16)! >> 16) & 0xFF) / 255.0,
            green: CGFloat((Int(hex, radix: 16)! >> 8) & 0xFF) / 255.0,
            blue:  CGFloat((Int(hex, radix: 16)!) & 0xFF) / 255.0, alpha: 1.0
        )
    }
}
