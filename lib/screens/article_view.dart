// import 'dart:async';

// import 'package:blog_app/widgets/Text.dart';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class ArticleView extends StatefulWidget {
//   final String blogUrl;

//   const ArticleView({Key key, this.blogUrl}) : super(key: key);
//   @override
//   _ArticleViewState createState() => _ArticleViewState();
// }

// class _ArticleViewState extends State<ArticleView> {
//   @override
//   final Completer<WebViewController> _completer =
//       Completer<WebViewController>();
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(text: "Smicks Blog", size: 20, color: Colors.white),
//           centerTitle: true,
//           elevation: 0.0,
//         ),
//         body: Container(
//           child: WebView(
//             initialUrl: widget.blogUrl,
//             onWebViewCreated: ((WebViewController webViewController) {
//               _completer.complete(webViewController);
//             }),
//           ),
//         ));
//   }
// }
