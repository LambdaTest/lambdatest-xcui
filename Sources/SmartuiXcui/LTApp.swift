import Foundation
public class LTApp {
    
    static let LOGLEVEL = Constants.KeyConstants.info
    private static let DEBUG = (LOGLEVEL == Constants.KeyConstants.debug)
    private static let LABEL = "[\u{001B}[35m lambdatest-xcui \u{001B}[39m]"
    public static let ignoreErrors = true
    private let provider: GenericProvider
    
    public init() {
        self.provider = GenericProvider()
    }
    
    public func screenshot(name: String) -> String? {
        return screenshot(name: name, customCropStatusBar: "", customCropNavigationBar: "")
    }
    
    public func screenshot(name: String, customCropStatusBar: String, customCropNavigationBar: String) -> String? {
        do {
            var screenshotDetails: [String: String] = [:]
            let arguments = ProcessInfo.processInfo.environment
        
            screenshotDetails[Constants.KeyConstants.screenshotName] = name
            screenshotDetails[Constants.KeyConstants.screenshotType] = "xcui-real-device"
            screenshotDetails[Constants.KeyConstants.projectToken] = arguments[Constants.KeyConstants.projectToken]
            screenshotDetails[Constants.KeyConstants.buildName] = arguments[Constants.KeyConstants.buildName]
            screenshotDetails[Constants.KeyConstants.buildId] = arguments[Constants.KeyConstants.smartuiBuildId]
            screenshotDetails[Constants.KeyConstants.deviceName] = arguments[Constants.KeyConstants.deviceName]
            screenshotDetails[Constants.KeyConstants.resolution] = arguments[Constants.KeyConstants.resolution]
            screenshotDetails[Constants.KeyConstants.os] = arguments[Constants.KeyConstants.os]
            screenshotDetails[Constants.KeyConstants.baseline] = arguments[Constants.KeyConstants.baseline]
            screenshotDetails[Constants.KeyConstants.browser] = arguments[Constants.KeyConstants.browser]
            screenshotDetails[Constants.KeyConstants.cropNavigationBar] = arguments[Constants.KeyConstants.cropNavigationBar]
            screenshotDetails[Constants.KeyConstants.cropStatusBar] = "true" //arguments[Constants.KeyConstants.cropStatusBar]
            screenshotDetails[Constants.KeyConstants.customCropStatusBar] = customCropStatusBar
            screenshotDetails[Constants.KeyConstants.customCropNavigationBar] = customCropNavigationBar

            let visualStr = arguments[Constants.KeyConstants.visual]
            let visual = (visualStr?.lowercased() == "true")
            var response = try provider.screenshot(screenshotDetails: &screenshotDetails)
            
            if visual {
                var realDeviceScreenshotDetails: [String: Any] = [:]
                realDeviceScreenshotDetails[Constants.KeyConstants.rdBuildId] = arguments[Constants.KeyConstants.rdBuildId]
                realDeviceScreenshotDetails[Constants.KeyConstants.deviceidCons] = arguments[Constants.KeyConstants.deviceId]
                realDeviceScreenshotDetails[Constants.KeyConstants.testId] = arguments[Constants.KeyConstants.testId]
                realDeviceScreenshotDetails[Constants.KeyConstants.orgId] = arguments[Constants.KeyConstants.orgId]
                realDeviceScreenshotDetails[Constants.KeyConstants.os] = Constants.KeyConstants.android
                realDeviceScreenshotDetails[Constants.KeyConstants.isAppAutomation] = true
                realDeviceScreenshotDetails[Constants.KeyConstants.screenshotId] = "\(name)-\(UUID().uuidString)"
                realDeviceScreenshotDetails[Constants.KeyConstants.url] = arguments[Constants.KeyConstants.screenshotHost]
                
                response = try provider.realDeviceScreenshot(realDeviceScreenshotDetails: realDeviceScreenshotDetails)
            }
            return response
        } catch let error {
            LTApp.log("Error taking screenshot \(name)")
            LTApp.log("\(error)", logLevel: Constants.KeyConstants.error)
            if !LTApp.ignoreErrors {
                fatalError("Error taking screenshot \(name): \(error)")
            }
        }
        return nil
    }
    
    static func log(_ message: String) {
        log(message, logLevel: Constants.KeyConstants.info)
    }
    
    static func log(_ message: String, logLevel: String) {
        if logLevel == Constants.KeyConstants.debug && DEBUG {
            print("\(LABEL) \(message)")
        } else if logLevel == Constants.KeyConstants.info {
            print("\(LABEL) \(message)")
        }
    }
}
