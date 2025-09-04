# BIQ iOS SDK

![Latest Release](https://img.shields.io/github/v/tag/biqprotocol/biq-sdk-ios-repo?label=latest&sort=semver)

The **BIQ iOS SDK** is a lightweight library that enables **proof of presence** for iOS applications using BLE beacons. When a user enters the proximity of one of our secure beacons and is authorized for a specific event, their presence is automatically validated.

---

## Features

- 🔌 **Singleton Controller** (`BiqController.shared`)
- ⚡ Presence start/stop and beacon scanning
- 🗂 Retrieve validation records
- 🛠 Debug tools (logs export, debug mode)
- 🔑 Session handling (API key + refresh token)
- 🚪 Logout and lifecycle management
- 📲 Permissions handling (Location, Bluetooth)
- ♻️ Background support (BLE & Location updates)
- 📡 SDK state listeners (presence state, scanning state, validation records)

---

## 📦 Installation

You can install the SDK via **Swift Package Manager (SPM)** by adding the following dependency in your project:

```swift
.package(url: "https://github.com/biqProtocol/biq-sdk-ios-repo", from: "<latest-version>")
```

Then add **`biq-sdk-ios-repo`** as a dependency to your app target.

---

## 🚀 Getting Started

### 1. Initialize the SDK

Before using the SDK, initialize the `BiqController`:

```swift
let _ = BiqController.Builder().build()
    .setDebugMode(true) // optional
    .setBootAutoScan(isStartAfterBoot: true) // optional auto start after reboot
    .initSession(
        apiKey: "your-api-key",
        refreshToken: "your-refresh-token"
    )
```

### 2. Start and Stop Presence

```swift
Task {
    let state = await BiqController.shared.startPresence()
    print("Started with state: \(state)")
    
    await BiqController.shared.stopPresence()
}
```

### 3. Bootstrap on Launch

To resume scanning automatically after device reboot or app relaunch, call `bootstrapOnLaunch()` inside your `AppDelegate`, `SceneDelegate`, or SwiftUI `App`:

#### UIKit AppDelegate (Recommended)

```swift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        initBiq()
        Task {
            let result = await BiqController.shared.bootstrapOnLaunch()
            print("On Launch: \(result)")
        }

        return true
    }
}
```

#### SceneDelegate

```swift
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        initBiq()
        Task {
            let result = await BiqController.shared.bootstrapOnLaunch()
            print("On Launch: \(result)")
        }
    }
}
```

#### SwiftUI App (with AppDelegate)

```swift
class HostAppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        initBiq()
        Task {
            let result = await BiqController.shared.bootstrapOnLaunch()
            print("On Launch: \(result)")
        }
        
        return true
    }
}

@main
struct MySwiftUIApp: App {
    @UIApplicationDelegateAdaptor(HostAppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

#### SwiftUI App (simpler fallback)

```swift
@main
struct MyApp: App {
    init() {
        initBiq()
        Task {
            let result = await BiqController.shared.bootstrapOnLaunch()
            print("On Launch: \(result)")
        }
    }

    var body: some Scene { 
        WindowGroup { ContentView() } 
    }
}
```

### Init Helper

```swift
func initBiq() {
    let _ = BiqController.Builder().build()
        .setDebugMode(true)
        .setBootAutoScan(isStartAfterBoot: true)
        .initSession(
            apiKey: "your-api-key",
            refreshToken: "your-refresh-token"
        )
}
```

---

## ⚠️ Permissions & Background Modes

The SDK requires the **host app** to declare and request the following permissions.  
The SDK **does not** request permissions — it only returns an error if permissions are missing when starting presence.

Add these to your **Info.plist** with descriptive messages:

- `NSLocationWhenInUseUsageDescription`
- `NSLocationAlwaysUsageDescription`
- `NSLocationAlwaysAndWhenInUseUsageDescription`
- `NSBluetoothAlwaysUsageDescription`

Enable **Background Modes**:

```
UIBackgroundModes:
 - bluetooth-central
 - location
```

Additionally, enable:
- **Uses Bluetooth LE accessories**
- **Location updates**

---

## 📊 State Listening

You can observe SDK state changes by implementing `BiqStateListener`:

```swift
extension MyClass: BiqController.BiqStateListener {
    func onSdkStateChanged(_ newState: BiqPresenceState) { ... }
    func onScanningStateChanged(_ newState: BiqScanningState) { ... }
    func onValidationRecordsChanged(_ newRecords: [PresenceProofResponseDto]) { ... }
}

// Attach listener
BiqController.shared.setPresenceStateListener(self)
```

---

## 🛠 Debugging

Enable debug mode to receive extended logs:

```swift
BiqController.shared.setDebugMode(true)
```

Export logs:

```swift
Task {
    let url = try await BiqController.shared.exportLogs()
    print("Logs exported at: \(url)")
}
```

---

## 📚 API Reference

### Core Methods
- `BiqController.Builder().build()` – Initializes the SDK (singleton).
- `initSession(apiKey:refreshToken:)` – Starts a session.
- `startPresence()` / `stopPresence()` – Control scanning.
- `bootstrapOnLaunch()` – Resume scanning after reboot/launch.
- `areAllPermissionsGranted()` – Check required permissions.
- `getValidationRecords()` – Retrieve proof events.
- `logout()` – End the session.

### Configuration
- `setDebugMode(_:)` – Enable verbose logging.
- `setBootAutoScan(isStartAfterBoot:)` – Allow auto-scan after reboot.

---

## ✅ Requirements

- iOS 15+
- Swift 5.8+
- Bluetooth LE enabled device
