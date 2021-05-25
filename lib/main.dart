// import 'package:blog_app/data/storiesdata.dart';
// import 'package:blog_app/data/storiesdata.dart';
// import 'package:blog_app/screens/skides.dart';
import 'package:blog_app/screens/welcome_screen.dart';
// import 'package:blog_app/screens/stories.dart';
// import 'package:blog_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: 'Montserrat',
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),
      // home: Slides(news: news,),
    );
  }
}

