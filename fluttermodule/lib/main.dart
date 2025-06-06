// import 'package:flutter/material.dart';
// // import 'package:webview_flutter/webview_flutter.dart';

// Future<void> main() async {
//   runApp(MaterialApp(home: WebViewExample()));
// }

// class WebViewExample extends StatefulWidget {
//   const WebViewExample({super.key});

//   @override
//   State<WebViewExample> createState() => _WebViewExampleState();
// }

// class _WebViewExampleState extends State<WebViewExample> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green,
//       appBar: AppBar(
//         title: const Text('Flutter Ne----'),
//         // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
//       ),
//       body: Center(
//         child: Text(
//           'flUTTEER Example',
//           style: TextStyle(fontSize: 24, color: Colors.white),
//         ),
//       ),
//       // body: WebViewWidget(
//       //   controller: WebViewController()
//       //     ..setBackgroundColor(Colors.white)
//       //     ..setNavigationDelegate(
//       //       NavigationDelegate(
//       //         onWebResourceError: (WebResourceError error) {
//       //           print('WebView error: ${error.description}');
//       //         },
//       //       ),
//       //     )
//       //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       //     ..loadRequest(Uri.parse('https://flutter.dev')),
//       // ),
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/myFlutterRoute': (context) => SecondScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Home')),
      body: Center(child: Text('Welcome to Flutter!')),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Second Screen')),
      body: Center(child: Text('Second Flutter Screen')),
    );
  }
}