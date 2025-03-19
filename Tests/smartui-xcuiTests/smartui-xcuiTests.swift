
import XCTest
#if canImport(UIKit)
import UIKit
#endif
@testable import SmartuiXcui

final class smartui_xcuiTests: XCTestCase {

    func testCaptureScreenshot() {
        let ltApp = LTApp()
        let screenshot =  ltApp.screenshot(name: "lambdatest")
        XCTAssertNotNil(screenshot, "Screenshot should not be nil")
    }
}
