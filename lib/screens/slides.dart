// // import 'package:blog_app/data/storiesdata.dart';
// // import 'package:blog_app/screens/detailscreen.dart';
// import 'package:blog_app/screens/homepage.dart';
// import 'package:blog_app/screens/interest_screen.dart';
// import 'package:blog_app/widgets/Text.dart';
// // import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// // import 'package:swipe_up/swipe_up.dart';

// class Slides extends StatefulWidget {
//   final List<News> news;
//   News buildSlides;

//   Slides({this.buildSlides, this.news});
//   @override
//   _SlidesState createState() => _SlidesState();
// }

// class _SlidesState extends State<Slides> with SingleTickerProviderStateMixin {
//   PageController _pageController;
//   AnimationController _animController;
//   int _currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//     _animController = AnimationController(vsync: this);

//     final News firstStory = widget.news.first;
//     // final News firstStory = widget.storiesListBuild.image;
//     _loadStory(story: firstStory, animateToPage: false);

//     _animController.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         _animController.stop();
//         _animController.reset();
//         setState(() {
//           if (_currentIndex + 1 < widget.news.length) {
//             _currentIndex += 1;
//             _loadStory(story: widget.news[_currentIndex]);
//           } else {
//             // Out of bounds - loop story
//             // You can also Navigator.of(context).pop() here
//             _currentIndex = 0;
//             _loadStory(story: widget.news[_currentIndex]);
//           }
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     _animController.dispose();
//     // _videoController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final News story = widget.news[_currentIndex];
//     // final News news = widget.stories[_currentIndex];
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         child: Column(
//           children: [
//             GestureDetector(
//               onTapDown: (details) => _onTapDown(details, story),
//               child: Container(
//                 height: MediaQuery.of(context).size.height * 0.8,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(100),
//                       bottomRight: Radius.circular(100)),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(120),
//                       bottomRight: Radius.circular(120)),
//                   child: Image.asset("images/bg-7.jpeg"),
//                 ),
//                 // child: Stack(
//                 //   children: [
//                 //     PageView.builder(
//                 //       controller: _pageController,
//                 //       physics: NeverScrollableScrollPhysics(),
//                 //       itemCount: widget.news.length,
//                 //       itemBuilder: (context, index) {
//                 //                         final News story = widget.news[index];
//                 //           switch (story.media) {
//                 //             case MediaType.image:
//                 //               return CachedNetworkImage(
//                 //                 imageUrl: story.url,
//                 //                 fit: BoxFit.cover,
//                 //               );
//                 //             // case MediaType.video:
//                 //             //   if (_videoController != null &&
//                 //             //       _videoController.value.initialized) {
//                 //             //     return FittedBox(
//                 //             //       fit: BoxFit.cover,
//                 //             //       child: SizedBox(
//                 //             //         width: _videoController.value.size.width,
//                 //             //         height: _videoController.value.size.height,
//                 //             //         child: VideoPlayer(_videoController),
//                 //             //       ),
//                 //             //     );
//                 //             //   }
//                 //           }
//                 //           return const SizedBox.shrink();
//                 //       },
//                 //     ),
//                 //     //  Container(
//                 //     //       height: MediaQuery.of(context).size.height * 1.0,
//                 //     //       width: MediaQuery.of(context).size.width,
//                 //     //       decoration: const BoxDecoration(
//                 //     //         gradient: LinearGradient(
//                 //     //           colors: [Colors.black, Colors.transparent],
//                 //     //           begin: Alignment.bottomLeft,
//                 //     //           end: Alignment.topCenter,
//                 //     //         ),
//                 //     //       ),
//                 //     //     ),
//                 //   //      Positioned(
//                 //   //       top: 80.0,
//                 //   //       left: 10.0,
//                 //   //       right: 10.0,
//                 //   //       child: Row(
//                 //   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //   //         children: [
//                 //   //           Container(
//                 //   //             alignment: Alignment.center,
//                 //   //             height: 40,
//                 //   //             width: 100,
//                 //   //             decoration: BoxDecoration(
//                 //   //               borderRadius: BorderRadius.circular(20),
//                 //   //               color: Colors.white,
//                 //   //             ),
//                 //   //             child: Text(text: "Trending", size: 17, color: Colors.blue[800]),
//                 //   //           ),

//                 //   //           IconButton(
//                 //   //             icon: const Icon(
//                 //   //               Icons.close,
//                 //   //               size: 30.0,
//                 //   //               color: Colors.white,
//                 //   //             ),
//                 //   //             onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => Homepage())),
//                 //   // ),
//                 //   //         ],
//                 //   //       )
//                 //   //     ),
//                 //   //     Positioned(
//                 //   //       bottom: 160,
//                 //   //       left: 10,
//                 //   //       child: Column(
//                 //   //         children: [
//                 //   //           Container(
//                 //   //             width: 300,
//                 //   //             child: Text(text: story.shortDesc, size: 30, color: Colors.white, weight: FontWeight.bold,)),
//                 //   //           SizedBox(height: 10),
//                 //   //           Container(
//                 //   //             width: 300,
//                 //   //             child: Text(text: story.fullDesc, size: 16, color: Colors.white,)),

//                 //   //         ],
//                 //   //       ),
//                 //   //     )
//                 //   ],
//                 // ),
//               ),
//             ),
//             // SizedBox(height: 28,),
//             GestureDetector(
//               onVerticalDragUpdate: (dragUpdateDetails) {
//                 Navigator.of(context).push(
//                     MaterialPageRoute(builder: (ctx) => InterestScreen()));
//               },
//               child: Container(
//                 height: 80,
//                 // color: Colors.blue,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.keyboard_arrow_up,
//                       size: 30,
//                     ),
//                     Text(
//                       text: "Swipe up to read more",
//                       size: 20,
//                       color: Colors.blueGrey[900],
//                       weight: FontWeight.bold,
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   void _onTapDown(TapDownDetails details, News story) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double dx = details.globalPosition.dx;
//     if (dx < screenWidth / 3) {
//       setState(() {
//         if (_currentIndex - 1 >= 0) {
//           _currentIndex -= 1;
//           _loadStory(story: widget.news[_currentIndex]);
//         }
//       });
//     } else if (dx > 2 * screenWidth / 3) {
//       setState(() {
//         if (_currentIndex + 1 < widget.news.length) {
//           _currentIndex += 1;
//           _loadStory(story: widget.news[_currentIndex]);
//         } else {
//           // Out of bounds - loop story
//           // You can also Navigator.of(context).pop() here
//           _currentIndex = 0;
//           _loadStory(story: widget.news[_currentIndex]);
//         }
//       });
//     }
//     // else {
//     //   if (story.media == MediaType.video) {
//     //     if (_videoController.value.isPlaying) {
//     //       _videoController.pause();
//     //       _animController.stop();
//     //     } else {
//     //       _videoController.play();
//     //       _animController.forward();
//     //     }
//     //   }
//     // }
//   }

//   void _loadStory({News story, bool animateToPage = true}) {
//     _animController.stop();
//     _animController.reset();
//     switch (story.media) {
//       case MediaType.image:
//         _animController.duration = story.duration;
//         _animController.forward();
//         break;
//         // case MediaType.video:
//         //   _videoController = null;
//         //   _videoController?.dispose();
//         //   _videoController = VideoPlayerController.network(story.url)
//         //     ..initialize().then((_) {
//         //       setState(() {});
//         //       if (_videoController.value.initialized) {
//         //         _animController.duration = _videoController.value.duration;
//         //         _videoController.play();
//         //         _animController.forward();
//         //       }
//         //     });
//         break;
//     }
//     if (animateToPage) {
//       _pageController.animateToPage(
//         _currentIndex,
//         duration: const Duration(milliseconds: 1),
//         curve: Curves.easeInOut,
//       );
//     }
//   }
// }

// class AnimatedBar extends StatelessWidget {
//   final AnimationController animController;
//   final int position;
//   final int currentIndex;

//   const AnimatedBar({
//     Key key,
//     @required this.animController,
//     @required this.position,
//     @required this.currentIndex,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 1.5),
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             return Stack(
//               children: <Widget>[
//                 _buildContainer(
//                   double.infinity,
//                   position < currentIndex
//                       ? Colors.white
//                       : Colors.white.withOpacity(0.5),
//                 ),
//                 position == currentIndex
//                     ? AnimatedBuilder(
//                         animation: animController,
//                         builder: (context, child) {
//                           return _buildContainer(
//                             constraints.maxWidth * animController.value,
//                             Colors.white,
//                           );
//                         },
//                       )
//                     : const SizedBox.shrink(),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Container _buildContainer(double width, Color color) {
//     return Container(
//       height: 5.0,
//       width: width,
//       decoration: BoxDecoration(
//         color: color,
//         border: Border.all(
//           color: Colors.black26,
//           width: 0.8,
//         ),
//         borderRadius: BorderRadius.circular(3.0),
//       ),
//     );
//   }
// }
