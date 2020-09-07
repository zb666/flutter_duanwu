package path.flutter.flutterduanwu

import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import path.flutter.flutterduanwu.batteryplugin.BatteryPlugin

class MainActivity : FlutterActivity() {

    companion object {
        val BATTERY_CHANNEL = "sample.flutter.io/battery"
        val METHOD_NAME = "batteryCount"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        BatteryPlugin.registerWith(flutterView)
        GeneratedPluginRegistrant.registerWith(FlutterEngine(this))
    }

}
