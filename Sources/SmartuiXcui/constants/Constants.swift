
import Foundation

struct Constants {
    
    struct ApiConstants {
        static let UPLOAD_API = "https://api.lambdatest.com/visualui/1.0/screenshot/save"
        static let REAL_DEVICE_UPLOAD_API = "https://mobile-api.lambdatest.com/framework/v1/espresso/screenshot"
    }

    struct KeyConstants {
        static let screenshotName = "screenshotName"
        static let screenshotType = "screenshotType"
        static let projectToken = "projectToken"
        static let buildName = "smartuiBuildName"
        static let smartuiBuildId = "smartuiBuildId"
        static let buildId = "buildId"
        static let deviceName = "deviceName"
        static let resolution = "resolution"
        static let os = "os"
        static let baseline = "baseline"
        static let browser = "browser"
        static let cropNavigationBar = "cropNavigationBar"
        static let cropStatusBar = "cropStatusBar"
        static let customCropStatusBar = "customCropStatusBar"
        static let customCropNavigationBar = "customCropNavigationBar"
        static let visual = "visual"

        // Real device screenshot keys
        static let rdBuildId = "rdBuildId"
        static let deviceId = "deviceId"
        static let testId = "testId"
        static let orgId = "orgId"
        static let android = "android"
        static let isAppAutomation = "isAppAutomation"
        static let screenshotId = "screenshotId"
        static let screenshotHost = "screenshotHost"
        static let deviceidCons = "deviceid"
        static let url = "url"
        static let error = "error"
        static let screenshot = "screenshot"
        static let contentType = "Content-Type"
        static let info = "info"
        static let debug = "debug"
    }
}
