// import 'package:blog_app/screens/homepage.dart';
// import 'package:blog_app/screens/skides.dart';
// import 'package:flutter/material.dart';

// class App extends StatefulWidget {
//   @override
//   _AppState createState() => _AppState();
// }

// class _AppState extends State<App> {

//   var _selectedPageIndex;
//   List<Widget> _pages;
//   PageController _pageController;


//   @override
//   void initState() {
//     super.initState();

//     _selectedPageIndex = 0;

//     _pages = [
//       Homepage(),
//       Slides(),
//     ];

//     _pageController = PageController(initialPage: _selectedPageIndex);
//   }


//   @override
//   void dispose() {
//     _pageController.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         //The following parameter is just to prevent
//         //the user from swiping to the next page.
//         physics: NeverScrollableScrollPhysics(),
//         children: _pages,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.photo_size_select_actual_outlined),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.ac_unit),
//             label: 'Search',
//           ),
//         ],
//         selectedItemColor: Colors.purple,
//         unselectedItemColor: Colors.purple,
//         showSelectedLabels: true,
//         showUnselectedLabels: false,
//         currentIndex: _selectedPageIndex,
//         onTap: (selectedPageIndex) {
//           setState(() {
//             _selectedPageIndex = selectedPageIndex;
//             _pageController.jumpToPage(selectedPageIndex);
//           });
//         },
//       ),
//     );
//   }
// }