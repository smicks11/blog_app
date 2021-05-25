import 'package:blog_app/data/storiesdata.dart';
import 'package:blog_app/screens/homepage.dart';
import 'package:blog_app/screens/skides.dart';
// import 'package:blog_app/screens/skides.dart';
import 'package:flutter/material.dart';

class BottomTab extends StatefulWidget {
  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int _currentIndex = 0;

  // final _pageOptions = [
  //   Homepage(),
  //   Slides(),
  //   // SignInScreen()
  // ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 0,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey.shade300,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      currentIndex: _currentIndex,
      onTap: (index) {
        if (index == 0) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Homepage();
          }));
        } else {
          setState(() {
            _currentIndex = index;
          });
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => Homepage()));
              },
            child: Icon(Icons.home)),
          title: Text(""),
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => Slides(news: news,)));
              },
              child: Icon(Icons.photo_size_select_actual_sharp)),
          title: Text(""),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text(""),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box),
          title: Text(""),
        ),
      ],
      type: BottomNavigationBarType.fixed,
    );
  }
}
