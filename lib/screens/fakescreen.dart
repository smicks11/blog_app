import 'package:flutter/material.dart';

class FakeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Work in Progress"),
      ),
    );
  }
}

// // import 'package:blog_app/data/storiesdata.dart';
// import 'package:blog_app/helper/repository.dart';
// import 'package:blog_app/widgets/Text.dart';
// import 'package:flutter/material.dart';
// // import 'package:swipedetector/swipedetector.dart';
// import 'dart:math' as math;

// import 'package:story_view/story_view.dart';

// enum VisibilityFlag {
//   visible,
//   invisible,
//   offscreen,
//   gone,
// }

// class FakeScreen extends StatefulWidget {
//   @override
//   _FakeScreenState createState() => _FakeScreenState();
// }

// class _FakeScreenState extends State<FakeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CollapsingList(),
//     );
//   }
// }

// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   _SliverAppBarDelegate({
//     @required this.minHeight,
//     @required this.maxHeight,
//     @required this.child,
//   });
//   final double minHeight;
//   final double maxHeight;
//   final Widget child;
//   @override
//   double get minExtent => minHeight;
//   @override
//   double get maxExtent => math.max(maxHeight, minHeight);
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return new SizedBox.expand(child: child);
//   }

//   @override
//   bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//     return maxHeight != oldDelegate.maxHeight ||
//         minHeight != oldDelegate.minHeight ||
//         child != oldDelegate.child;
//   }
// }

// class CollapsingList extends StatefulWidget {
//   @override
//   _CollapsingListState createState() => _CollapsingListState();
// }

// class _CollapsingListState extends State<CollapsingList> {
//   ScrollController _scrollController = ScrollController();

//   bool isShowText = false;
//   bool swipeText = true;
//   @override
//   void initState() {
//     super.initState();
    
//     _scrollController.addListener(() {
//       // if (_scrollController.offset ==
//       //     _scrollController.position.maxScrollExtent) {
//       //   print("At down");
//       //   setState(() {
//       //     isShowText = false;
//       //     swipeText = true;
//       //   });
//       if (_scrollController.offset < 50) {
//         print("down");
//         setState(() {
//           isShowText = false;
//           swipeText = true;
//         });
//       } else {
//         print("it is up");
//         setState(() {
//           isShowText = true;
//           swipeText = false;
//         });

//       }
//     });
//   }

//   Widget _buildHighlights(List<Highlight> highlights) {
//     final stories = highlights.map<StoryItem>((it) {
//       return StoryItem.pageImage(NetworkImage(it.image.toString()),
//           caption: it.headline.toString(), imageFit: BoxFit.cover);
//     }).toList();
//     return StoryView(
//       stories,
//       repeat: true,
//       inline: false,
//       // progressPosition: ProgressPosition.bottom,
//     );
//   }

//   Widget _buildNews(Gnews news) {
//     return Container(
//       child: ClipRRect(
//           borderRadius: BorderRadius.circular(20),
//           child: _buildHighlights(news.highlights)),
//     );
//   }

//   SliverPersistentHeader makeHeader(String headerText) {
//     return SliverPersistentHeader(
//       pinned: true,
//       floating: true,
//       delegate: _SliverAppBarDelegate(
//         minHeight: 400.0,
//         maxHeight: 600.0,
//         child: Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             // color: Colors.blue,
//           ),
//           child: FutureBuilder(
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return _buildNews(snapshot.data);
//               }

//               if (snapshot.hasError) {
//                 return Center(child: Text("Internet connection altered"));
//               }

//               return Center(
//                 child: SizedBox(
//                   width: 40,
//                   height: 40,
//                   child: CircularProgressIndicator(),
//                 ),
//               );
//             },
//             future: Repository.getNews(),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       controller: _scrollController,
//       slivers: <Widget>[
//         makeHeader('Header Section 1'),
//         SliverFillRemaining(
//           hasScrollBody: true,
//           fillOverscroll: true,
//           child: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Visibility(
//                   visible: swipeText,
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.keyboard_arrow_up,
//                           size: 22,
//                         ),
//                         Text(
//                           text: "Swipe up to read more",
//                           size: 16,
//                           color: Colors.blueGrey[900],
//                           weight: FontWeight.bold,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Visibility(
//                   visible: isShowText,
//                   child: Container(
//                     child: Text(
//                       text: "Naomi Osaka has withdrawn from the French Open, announcing Monday on social media that she will take some time away from the court one day after she was fined and threatened with harsher sanctions",
//                       color: Colors.black,
//                       size: 22,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),

//         //
//       ],
//     );
//   }
// }
