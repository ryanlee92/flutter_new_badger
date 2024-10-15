package ch.simonbraillard.flutter_new_badger

import android.content.Context
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import me.leolin.shortcutbadger.ShortcutBadger

/** FlutterBadgerPlugin */
class FlutterNewBadgerPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_new_badger")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      "setBadge" -> {
        val count = call.argument<Int>("count")
        if (count != null) {
          applyBadgeCount(count, result)
        } else {
          result.error("bad_args", "Invalid badge count", null)
        }
      }
      "removeBadge" -> {
        removeBadgeCount(result)
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  private fun applyBadgeCount(count: Int, result: Result) {
    try {
      // Apply the badge count
      ShortcutBadger.applyCount(context, count)
      result.success(null)
    } catch (e: Exception) {
      result.error("badge_error", "Failed to set badge: ${e.localizedMessage}", null)
    }
  }

  private fun removeBadgeCount(result: Result) {
    try {
      // Remove the badge count
      ShortcutBadger.removeCount(context)
      result.success(null)
    } catch (e: Exception) {
      result.error("badge_error", "Failed to remove badge: ${e.localizedMessage}", null)
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
