import Foundation
import UIKit
import XCTest

public class ScreenshotController: UIViewController {
  // swiftlint:disable:next unneeded_override
  public override func viewDidLoad() {
    super.viewDidLoad()
  }

  public func takeScreenshot() throws -> String {
    do {
      let screenshot = XCUIScreen.main.screenshot()
      guard let imageData = screenshot.image.pngData() else {
        throw LTAppError.screenshotError("Failed to convert screenshot to PNG data")
      }
      return imageData.base64EncodedString()
    } catch {
      throw LTAppError.screenshotError("Failed to take screenshot: \(error.localizedDescription)")
    }
  }
}
