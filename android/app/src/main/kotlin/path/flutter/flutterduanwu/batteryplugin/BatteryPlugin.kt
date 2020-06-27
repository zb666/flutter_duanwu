package path.flutter.flutterduanwu.batteryplugin

import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import path.flutter.flutterduanwu.MainActivity

class BatteryPlugin {

    companion object{

        private const val BATTERY_CHANNEL = "sample.flutter.io/battery"
        const val METHOD_NAME = "batteryCount"

        fun registerWith(messageBinary:BinaryMessenger){
            MethodChannel(messageBinary, BATTERY_CHANNEL).setMethodCallHandler { call, result ->
                when (call.method) {
                    MainActivity.METHOD_NAME -> {
                        when (getBattteryLevel()) {
                            10 -> {
                                result.success(10)
                            }
                            -1 -> {
                                result.error("UNKNOW_BATTERY", "error", "details")
                            }
                            else -> result.notImplemented()
                        }
                    }
                    else -> {
                    }
                }
            }
        }

       private fun getBattteryLevel(): Int {
            return 10
        }

    }

}