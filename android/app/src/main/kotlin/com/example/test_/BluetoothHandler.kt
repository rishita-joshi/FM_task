// package com.example.test_

// import android.Manifest
// import androidx.annotation.NonNull
// import io.flutter.embedding.engine.plugins.FlutterPlugin
// import io.flutter.plugin.common.BinaryMessenger
// import io.flutter.plugin.common.MethodCall
// import io.flutter.plugin.common.MethodChannel
// import pub.devrel.easypermissions.EasyPermissions

// class BluetoothHandler(private val binaryMessenger: BinaryMessenger) : FlutterPlugin, MethodChannel.MethodCallHandler {

//     private var methodChannel: MethodChannel? = null
//     private val bluetoothPermission = Manifest.permission.BLUETOOTH

//     companion object {
//         private const val CHANNEL_NAME = "com.example.app/method_channel"
//     }

//     override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
//         when (call.method) {
//             "requestBluetoothPermission" -> requestBluetoothPermission(result)
//             else -> result.notImplemented()
//         }
//     }

//     private fun requestBluetoothPermission(result: MethodChannel.Result) {
//         val activity = PluginRegistry.ActivityProvider { null }
//         val permissions = arrayOf(bluetoothPermission)

//         if (EasyPermissions.hasPermissions(activity.requireActivity(), *permissions)) {
//             // Permission already granted
//             result.success(true)
//         } else {
//             // Request permission
//             EasyPermissions.requestPermissions(activity.requireActivity(), "Please grant Bluetooth permission.", 0, *permissions)
//             result.success(false)
//         }
//     }

//     override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
//         methodChannel = MethodChannel(flutterPluginBinding.binaryMessenger, CHANNEL_NAME)
//         methodChannel?.setMethodCallHandler(this)
//     }

//     override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
//         methodChannel?.setMethodCallHandler(null)
//         methodChannel = null
//     }

//     fun onRequestPermissionsResult(requestCode: Int, permissions: Array<String>, grantResults: IntArray): Boolean {
//         return EasyPermissions.onRequestPermissionsResult(requestCode, permissions, grantResults)
//     }
// }
