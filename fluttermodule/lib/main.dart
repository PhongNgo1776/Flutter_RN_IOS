import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// Import for iOS/macOS features.

Future<void> main() async {
  runApp(MaterialApp(home: WebViewExample()));
}

class WebViewExample extends StatefulWidget {
  const WebViewExample({super.key});

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Flutter Ne----'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
      ),
      body: WebViewWidget(
        controller: WebViewController()
          ..setBackgroundColor(Colors.white)
          ..setNavigationDelegate(
            NavigationDelegate(
              onWebResourceError: (WebResourceError error) {
                print('WebView error: ${error.description}');
              },
            ),
          )
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse('https://flutter.dev')),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// void main() => runApp(const LocalTextApp());

// class LocalTextApp extends StatelessWidget {
//   const LocalTextApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Text Viewer')),
//         body: const LocalTextViewer(),
//       ),
//     );
//   }
// }

// class LocalTextViewer extends StatefulWidget {
//   const LocalTextViewer({super.key});

//   @override
//   State<LocalTextViewer> createState() => _LocalTextViewerState();
// }

// class _LocalTextViewerState extends State<LocalTextViewer> {
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Future.delayed(const Duration(seconds: 5), () {
//         setState(() {});
//       });
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     debugPrint('Building LocalTextViewer');
//     const htmlContent = '''
//       <!DOCTYPE html>
//       <html>
//       </head>
//       <body>
//         <h1>Local Text Display</h1>
//         <p>This content is loaded locally in the WebView.</p>
//         <p>You can display formatted text, code snippets, or any HTML content.</p>
//       </body>
//       </html>
//     ''';

//     return WebViewWidget(
//         controller: WebViewController()
//           ..loadHtmlString(htmlContent)
//           ..setJavaScriptMode(JavaScriptMode.unrestricted));
//   }
// }
