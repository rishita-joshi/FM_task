import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:test_/screens/bluetooth_page.dart';
import 'package:test_/screens/image_display.dart';
import 'package:test_/screens/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    BlutoothPage().launch(context);
                  },
                  child: Text("Bluetooth Page")),
            ),
            20.height,
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    ProfileScreen().launch(context);
                  },
                  child: Text("Profile Page")),
            ),
            20.height,
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    ImageDisplay().launch(context);
                  },
                  child: Text("Image Page")),
            ),
          ],
        ),
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   static const platform = const MethodChannel('com.example.app/method_channel');

//   String response = 'No response yet';

//   Future<void> invokeNativeMethod() async {
//     String result;
//     try {
//       result = await platform.invokeMethod('nativeMethod');
//     } on PlatformException catch (e) {
//       result = 'Error: ${e.message}';
//     }

//     setState(() {
//       response = result;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('MethodChannel Example'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Response from native code:',
//               ),
//               Text(
//                 '$response',
//                 style: TextStyle(fontSize: 20),
//               ),
//               ElevatedButton(
//                 onPressed: invokeNativeMethod,
//                 child: Text('Invoke Native Method'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
