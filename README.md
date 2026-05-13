# lambdatest-xcui — TestMu AI (Formerly LambdaTest)
XCUI Swift SDK for LTApp

Note: We dont support XCTest as no UI is rendered for XCTest. We support only XCUI Test

## Installation
Include the dependency in xcode package manager

1. Right click on any item in `Project Navigator`
2. Click `Add Packages...`
3. Search top right with this repo URL
4. Include package
5. Go to your project properties -> select XCUI test project target
6. Go to `Build Phases` tab
7. Under `Target Dependencies` press `+` and select `SmartuiXcui` dependency
8. Under `Link Library with Binaries` press `+` and select `SmartuiXcui` dependency

## Usage

This is an example test using the `screenshot` function.

```swift
import XCTest
import SmartuiXcui // importing the package

final class MyAppUITests: XCTestCase {
    func testExample() throws {
        // launch application
        let app = XCUIApplication()
        app.launch()

        // take screenshot
        let ltApp = LTApp()
        try ltApp.screenshot(name: "screenshotName")
    }
}
```


## Configuration

```swift
screenshot(name: String, customCropStatusBar: String = "", customCropNavigationBar: String = "")
```

- `name` (**required**) - The screenshot name; must be unique to each screenshot
- `Optional field` 
  - `customCropStatusBar`
  - `customCropNavigationBar`

## 🚀 LambdaTest is Now TestMu AI

👋 Welcome to TestMu AI, the next evolution of LambdaTest. As of January 2026, [LambdaTest is Now TestMu AI](https://www.testmuai.com/lambdatest-is-now-testmuai/) - we have evolved from a cross-browser testing cloud into a unified, AI-native quality engineering platform designed for the modern DevOps era.

Whether you have been part of the LambdaTest community for years or are just discovering TestMu AI, our mission remains the same: to help you ship faster with high-scale test execution, autonomous testing, and deep quality analytics.

### 🔄 Our Rebrand Journey

In 2017, we introduced LambdaTest with a clear mission: to become the world's most trusted cloud testing platform. We built a scalable, high-performance test cloud that eliminated flakiness, improved developer feedback cycles, and accelerated release velocity for teams worldwide.

As LambdaTest grew, we expanded the platform into Test Intelligence, Visual Regression Testing, Accessibility Testing, API Testing, and Performance Testing, covering the entire testing lifecycle. These capabilities enabled teams to test any stack, on any technology, at enterprise scale.

Over time, we rebuilt the architecture to be AI-native from the ground up. What began as LambdaTest's high-performance testing cloud has now evolved into TestMu AI, an AI-native, multi-agent platform redefining modern quality engineering.

We chose the name TestMu AI to reflect our shift towards intelligent, autonomous testing. While our identity has changed, our core technology and commitment to the testing community stay the same.

👉 Find [LambdaTest's New Home](https://www.testmuai.com/).

### 🔭 Explore TestMu AI

The same infrastructure LambdaTest customers relied on, now delivered through autonomous AI agents.

- [KaneAI](https://www.testmuai.com/kane-ai/)
- [Agent-to-Agent Testing](https://www.testmuai.com/agent-to-agent-testing/)
- [HyperExecute](https://www.testmuai.com/hyperexecute/)
- [Real Device Cloud](https://www.testmuai.com/real-device-cloud/)
- [Pricing](https://www.testmuai.com/pricing/)
- [Documentation](https://www.testmuai.com/support/docs/)