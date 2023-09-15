import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BlutoothPage extends StatefulWidget {
  @override
  _BlutoothPageState createState() => _BlutoothPageState();
}

class _BlutoothPageState extends State<BlutoothPage> {
  static const platform = const MethodChannel('com.example.app/method_channel');

  String response = 'No response yet';

  Future<void> invokeNativeMethod() async {
    String result;
    try {
      result = await platform.invokeMethod('nativeMethod');
    } on PlatformException catch (e) {
      result = 'Error: ${e.message}';
    }

    setState(() {
      response = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MethodChannel Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Response from native code:',
            ),
            Text(
              '$response',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: invokeNativeMethod,
              child: Text('Invoke Native Method'),
            ),
          ],
        ),
      ),
    );
  }
}
