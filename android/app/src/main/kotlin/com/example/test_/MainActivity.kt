package com.example.test_
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.bluetooth.BluetoothAdapter


class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.app/method_channel"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val flutterEngine: FlutterEngine = flutterEngine!!

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "nativeMethod") {
                val message = "Hello from native code"
               // result.success(message)
               result.success(startBluetooth())
            } else {
                result.notImplemented()
            }
        }
    }

    private fun startBluetooth(): String {
        val bluetoothAdapter = BluetoothAdapter.getDefaultAdapter()
        
        return if (bluetoothAdapter != null) {
            if (bluetoothAdapter.isEnabled) {
                "Bluetooth is already enabled."
            } else {
                bluetoothAdapter.enable()
                "Bluetooth has been enabled."
            }
        } else {
            "Device does not support Bluetooth."
        }
    }

}
