// import 'package:blog_app/data/storiesdata.dart';
import 'package:blog_app/helper/repository.dart';
// import 'package:blog_app/widgets/CustomText.dart';
import 'package:flutter/material.dart';
// import 'package:swipedetector/swipedetector.dart';
import 'dart:math' as math;
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:story_view/story_view.dart';

enum VisibilityFlag {
  visible,
  invisible,
  offscreen,
  gone,
}

class StoryPageView extends StatefulWidget {
  @override
  _StoryPageViewState createState() => _StoryPageViewState();
}

class _StoryPageViewState extends State<StoryPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CollapsingList(),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class CollapsingList extends StatefulWidget {
  @override
  _CollapsingListState createState() => _CollapsingListState();
}

class _CollapsingListState extends State<CollapsingList> {
  ScrollController _scrollController = ScrollController();

  bool isShowText = false;
  bool swipeText = true;
  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      // if (_scrollController.offset ==
      //     _scrollController.position.maxScrollExtent) {
      //   print("At down");
      //   setState(() {
      //     isShowText = false;
      //     swipeText = true;
      //   });
      if (_scrollController.offset < 50) {
        print("down");
        setState(() {
          isShowText = false;
          swipeText = true;
        });
      } else {
        print("it is up");
        setState(() {
          isShowText = true;
          swipeText = false;
        });
      }
    });
  }

  Widget _buildHighlights(List<Highlight> highlights) {
    final stories = highlights.map<StoryItem>((it) {
      return StoryItem.pageImage(NetworkImage(it.image.toString()),
          caption: it.headline, imageFit: BoxFit.cover);
    }).toList();
    return StoryView(
      stories,
      repeat: true,
      inline: false,
      // progressPosition: ProgressPosition.bottom,
    );
  }

  Widget _buildNews(Gnews news) {
    return Container(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: _buildHighlights(news.highlights)),
    );
  }

  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 400.0,
        maxHeight: 600.0,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color: Colors.blue,
          ),
          child: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _buildNews(snapshot.data);
              }

              if (snapshot.hasError) {
                return Center(child: Text("Internet connection altered"));
              }

              return Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: SpinKitThreeBounce(
                    color: Colors.blueAccent,
                    // shape: BoxShape.circle,
                    duration: Duration(milliseconds: 1500),
                  ),
                ),
              );
            },
            future: Repository.getNews(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        makeHeader('Header Section 1'),
        SliverFillRemaining(
          hasScrollBody: true,
          fillOverscroll: true,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: swipeText,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_up,
                          size: 22,
                        ),
                        Text(
                          "Swipe up to read more",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blueGrey[900],
                            fontWeight: FontWeight.bold
                          ),

                        )
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: isShowText,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      
                          "Naomi Osaka has withdrawn from the French Open, announcing Monday on social media that she will take some time away from the court one day after she was fined and threatened with harsher sanctions",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                     
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        //
      ],
    );
  }
}









































































































































































// import 'package:blog_app/helper/repository.dart';
// import 'package:blog_app/widgets/Text.dart';
// import 'package:flutter/material.dart';
// import 'package:story_view/story_view.dart';

// class StoryPageView extends StatefulWidget {
//   final Function() onSwipeUp;

//   const StoryPageView({Key key, this.onSwipeUp}) : super(key: key);
//   // final StoryController controller = StoryController();
//   // story view here
//   @override
//   _StoryPageViewState createState() => _StoryPageViewState();
// }

// class _StoryPageViewState extends State<StoryPageView> {
//   DragUpdateDetails updateVerticalDragDetails;
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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * 0.8,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               // color: Colors.blue,
//             ),
//             child: FutureBuilder(
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return _buildNews(snapshot.data);
//                 }

//                 if (snapshot.hasError) {
//                   return Center(child: Text("Internet connection altered"));
//                 }

//                 return Center(
//                   child: SizedBox(
//                     width: 40,
//                     height: 40,
//                     child: CircularProgressIndicator(),
//                   ),
//                 );
//               },
//               future: Repository.getNews(),
//             ),
//           ),
//           Container(
//               height: 80,
//               child: GestureDetector(
//                  behavior: HitTestBehavior.deferToChild,
//                   onVerticalDragUpdate: (details) {
//                     var test1 = "test1";
//                     print(test1);
//                     setState(() {
                                          
//                     });
//                   },
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.keyboard_arrow_up,
//                       size: 22,
//                     ),
//                     Text(
//                       text: "Swipe up to read more",
//                       size: 16,
//                       color: Colors.blueGrey[900],
//                       weight: FontWeight.bold,
//                     )
//                   ],
//                 ),
//               )

//               // color: Colors.blue,

//               ),
//         ],
//       ),
//     );
//   }
// }
