import Foundation
import SpotHero_iOS_Partner_SDK

@objc(SpotHeroSDK) class SpotHeroSDK : CDVPlugin {
    func startup(command: CDVInvokedUrlCommand) {
        let spotHeroSDK = SpotHeroPartnerSDK.SharedInstance
        guard let key = command.arguments[0] as? String else {
            return
        }

        SpotHeroPartnerSDK.SharedInstance.partnerApplicationKey = key

        // if let name = command.arguments[1] as? String {
        //     spotHeroSDK.partnerApplicationName = name
        // }

        // if let tintColor = command.arguments[2] as? String {
        //     spotHeroSDK.tintColor = UIColor
        // }

        // if let textColor = command.arguments[3] as? String {
        //     spotHeroSDK.textColor = command.arguments[3]
        // }

        spotHeroSDK.launchSDKFromViewController(self.viewController)

        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)

        self.commandDelegate.sendPluginResult(pluginResult, callbackId:command.callbackId)
    }
}