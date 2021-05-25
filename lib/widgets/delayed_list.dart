// import 'dart:async';

// import 'package:blog_app/screens/homepage.dart';
// import 'package:blog_app/widgets/shimmerwidget.dart';
// import 'package:flutter/material.dart';

// class DelayedHomeList extends StatefulWidget {
//   @override
//   _DelayedHomeListState createState() => _DelayedHomeListState();
// }

// class _DelayedHomeListState extends State<DelayedHomeList> {
//   bool isLoading = true;
//   @override
//   Widget build(BuildContext context) {
//     Timer timer = Timer(Duration(seconds: 3), () {
//       setState(() {
//         isLoading = false;
//       });
//     });
//     return isLoading ? ShimmerList() : Homepage(timer: timer,);
//   }
// }
