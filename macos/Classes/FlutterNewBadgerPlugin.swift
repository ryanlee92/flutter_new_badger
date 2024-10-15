import Cocoa
import FlutterMacOS

public class FlutterNewBadgerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_new_badger", binaryMessenger: registrar.messenger)
    let instance = FlutterNewBadgerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch call.method {
      case "setBadge":
        if let arguments = call.arguments as? [String: Any], let count = arguments["count"] as? Int {
          NSApplication.shared.dockTile.badgeLabel = count > 0 ? "\(count)" : nil
          result(nil)
        } else {
          result(FlutterError(code: "bad_args", message: "Invalid arguments for setting badge count", details: nil))
        }

      case "removeBadge":
        NSApplication.shared.dockTile.badgeLabel = ""
        result(nil)

      default:
        result(FlutterMethodNotImplemented)
      }
    }
}
