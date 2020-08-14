package path.flutter.flutterduanwu

import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.view.FlutterNativeView
import io.flutter.view.FlutterView
import path.flutter.flutterduanwu.batteryplugin.BatteryPlugin

class DemoActivity : FlutterActivity() {

    companion object {
        val BATTERY_CHANNEL = "sample.flutter.io/battery"
        val METHOD_NAME = "batteryCount"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.avtivity_native)
    }

}
