// // import 'dart:async';

// // import 'package:blog_app/widgets/popularnews.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// // import 'package:movie_app/screens/moviedetail.dart';
// // import 'package:movie_app/widgets/customtext.dart';
// import 'package:shimmer/shimmer.dart';

// import 'customtext.dart';
// // import 'featuedNews.dart';

// class ShimmerList extends StatefulWidget {
  
//   @override
//   _ShimmerListState createState() => _ShimmerListState();
// }

// class _ShimmerListState extends State<ShimmerList> {
//   int offset = 0;
//   int time = 800;

  


//   @override
//   Widget build(BuildContext context) {
//     offset += 5;
//     time = 800 + offset;
//     print(time);

//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         margin: EdgeInsets.symmetric(horizontal: 20),
//         child: ListView(
//           children: [
//             Container(
//               height: 150,
//               width: double.infinity,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                     onTap: () {},
//                     child: Container(
//                         width: 30, child: Image.asset("images/icon.png")),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Shimmer.fromColors(
//                     highlightColor: Colors.grey[850],
//                     baseColor: Color(0xff16161d),
//                     period: Duration(milliseconds: time),
//                     child: CustomText(
//                       text: "Featured",
//                       size: 40,
//                       color: Colors.black,
//                       weight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 2,
//                   ),
//                   Shimmer.fromColors(
//                     highlightColor: Colors.grey[850],
//                       baseColor: Color(0xff16161d),
//                       period: Duration(milliseconds: time),
//                     child: CustomText(
//                       text: "Based on your interest",
//                       size: 22,
//                       color: Colors.black26,
//                       weight: FontWeight.bold,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 24,
//             ),
//             Container(
//               height: 290,
//               child: Shimmer.fromColors(
//                 highlightColor: Colors.grey[850],
//                       baseColor: Color(0xff16161d),
//                       period: Duration(milliseconds: time),
//                 child: ListView.builder(
                  
//                   scrollDirection: Axis.horizontal,
//                   shrinkWrap: true,
//                   physics: BouncingScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     return Container(
//                       height: 500,
//                     );
//                   },
//                 ),
//               ),
//             ),
//             Divider(),
//             Container(
//               height: 70,
//               width: double.infinity,
//               child: Row(
//                 children: [
//                   Container(
//                     height: 35,
//                     width: 3,
//                     color: Colors.blue,
//                   ),
//                   SizedBox(
//                     width: 12,
//                   ),
//                   Shimmer.fromColors(
//                     highlightColor: Colors.grey[850],
//                       baseColor: Color(0xff16161d),
//                       period: Duration(milliseconds: time),
//                     child: CustomText(
//                       text: "Popular on BBC News",
//                       size: 24,
//                       color: Colors.black,
//                       weight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SingleChildScrollView(
//               // height: double.infinity,
//               // width: double.infinity,
//               child: Shimmer.fromColors(
//                 highlightColor: Colors.grey[850],
//                       baseColor: Color(0xff16161d),
//                       period: Duration(milliseconds: time),
//                 child: ListView.builder(
//                   physics: NeverScrollableScrollPhysics(),
                  
//                   shrinkWrap: true,
//                   scrollDirection: Axis.vertical,
//                   itemBuilder: (_, index) {
//                     return Container();
//                   },
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }






