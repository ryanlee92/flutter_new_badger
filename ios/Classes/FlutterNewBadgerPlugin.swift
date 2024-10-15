import Flutter
import UIKit
import UserNotifications

public class FlutterNewBadgerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_new_badger", binaryMessenger: registrar.messenger())
    let instance = FlutterNewBadgerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch call.method {
      case "setBadge":
        if let arguments = call.arguments as? [String: Any], let count = arguments["count"] as? Int {
          setBadgeCount(count: count, result: result)
        } else {
          result(FlutterError(code: "bad_args", message: "Invalid arguments for setting badge count", details: nil))
        }

      case "removeBadge":
        setBadgeCount(count: 0, result: result)

      default:
        result(FlutterMethodNotImplemented)
      }
    }

    private func setBadgeCount(count: Int, result: @escaping FlutterResult) {
        // Request notification authorization if not already granted
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge]) { granted, error in
          if let error = error {
            result(FlutterError(code: "auth_error", message: "Notification authorization failed", details: error.localizedDescription))
            return
          }

          if granted {
            // Set the badge count using UNUserNotificationCenter
            DispatchQueue.main.async {
                if #available(iOS 16.0, *) {
                    UNUserNotificationCenter.current().setBadgeCount(count) { error in
                        if let error = error {
                            result(FlutterError(code: "badge_error", message: "Failed to set badge", details: error.localizedDescription))
                        } else {
                            result(nil)
                        }
                    }
                } else {
                    // Fallback on earlier versions
                    DispatchQueue.main.async {
                        UIApplication.shared.applicationIconBadgeNumber = count
                        result(nil)
                      }
                }
            }
          } else {
            result(FlutterError(code: "permission_denied", message: "Badge permission not granted", details: nil))
          }
        }
      }
}
