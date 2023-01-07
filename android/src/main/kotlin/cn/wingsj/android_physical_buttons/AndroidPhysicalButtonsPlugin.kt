package cn.wingsj.android_physical_buttons

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel

class AndroidPhysicalButtonsPlugin : FlutterPlugin, EventChannel.StreamHandler, BroadcastReceiver() {
    private var actionVolume = "android.media.VOLUME_CHANGED_ACTION"
    private lateinit var channel: EventChannel
    private var sink: EventChannel.EventSink? = null

    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel = EventChannel(binding.binaryMessenger, "android_physical_buttons")
        channel.setStreamHandler(this)

        val filter = IntentFilter()
        filter.addAction(Intent.ACTION_SCREEN_ON)
        filter.addAction(Intent.ACTION_SCREEN_OFF)
        filter.addAction(actionVolume)
        binding.applicationContext.registerReceiver(this, filter)
    }

    override fun onListen(arguments: Any?, sink: EventChannel.EventSink?) {
        this.sink = sink
    }

    override fun onCancel(arguments: Any?) {}

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setStreamHandler(null)
    }

    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action.equals(Intent.ACTION_SCREEN_ON) || intent.action.equals(Intent.ACTION_SCREEN_OFF)) {
            sink?.success("power");
        } else if (intent.action.equals(actionVolume)) {
            sink?.success("volume");
        }
    }
}
