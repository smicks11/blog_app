// // import 'package:blog_app/data/filter_chips.dart';
// import 'package:blog_app/helper/data.dart';
// import 'package:blog_app/model/category_model.dart';
// // import 'package:blog_app/model/filter_chip_data.dart';
// import 'package:blog_app/screens/homepage.dart';
// import 'package:blog_app/screens/pageview.dart';
// import 'package:blog_app/widgets/Text.dart';
// // import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class ChipperScreen extends StatefulWidget {
//   @override
//   _ChipperScreenState createState() => _ChipperScreenState();
// }

// class _ChipperScreenState extends State<ChipperScreen> {
//   List<CategoryModel> categories = List<CategoryModel>.empty(growable: true);

//   CategoryModel categoryModel = CategoryModel();
//   @override
//   void initState() {
//     super.initState();
//     categories = getCategories();
//   }

//   final double spacing = 8;
//   // List<FilterChipData> filterChips = FilterChips.all;
//   Widget buildFilterChips() {
//     return GestureDetector(
//        onTap: () {
//                         print("tapped");
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (ctx) =>
//                                 PageViewScreen(subCategory: )));
//                       },
//       child: Wrap(
//         runSpacing: spacing,
//         spacing: spacing,
//         children: categories
//             .map((filterChip) => Theme(
//                   data: ThemeData(canvasColor: Colors.transparent),
//                   child: GestureDetector(
                    
//                     child: FilterChip(
//                       // showCheckmark: false,
//                       shape: RoundedRectangleBorder(
//                         side: BorderSide(color: Colors.white24, width: 1),
//                       ),

//                       label: Text(filterChip.label),
//                       labelStyle: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color:
//                               filterChip.isSelected ? Colors.black : Colors.white),
//                       // backgroundColor: filterChip.color.withOpacity(0.1),
//                       // onSelected: (isSelected) => setState(() {
//                       //   // categories = categories.map((otherChip) {
//                       //   //   return filterChip == otherChip
//                       //   //       ? otherChip.copy(isSelected: isSelected)
//                       //   //       : otherChip;
//                       //   // }).toList();
//                       // }),
//                       onSelected: (isSelected) => GestureDetector(
//                         onTap: () {
//                           print("tapped");
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (ctx) =>
//                                   PageViewScreen(subCategory: filterChip.label)));
//                         },
//                       ),

//                       selected: filterChip.isSelected,
//                       checkmarkColor: Colors.black,
//                       selectedColor: Colors.white,
//                     ),
//                   ),
//                 ))
//             .toList(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: BoxDecoration(
//             image: DecorationImage(
//           image: AssetImage("images/bg-3.jpeg"),
//           fit: BoxFit.fill,
//         )),
//         child: Container(
//           margin: EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               Container(
//                 height: 200,
//                 width: double.infinity,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       text: "Select your favorite\nnews categories",
//                       size: 30,
//                       color: Colors.white,
//                       weight: FontWeight.bold,
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Container(
//                 child: buildFilterChips(),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               // Container(
//               //   height: 120,
//               //   width: double.infinity,
//               //   child: Column(
//               //     mainAxisAlignment: MainAxisAlignment.end,
//               //     children: [
//               //       GestureDetector(
//               //         onTap: () {
//               //           Navigator.of(context).pushReplacement(MaterialPageRoute(
//               //               builder: (ctx) => Homepage(
//               //                     category: categoryModel.label
//               //                         .toString()
//               //                         .toLowerCase(),
//               //                   )));

//               //         },
//               //         child: Container(
//               //           decoration: BoxDecoration(
//               //             color: Colors.greenAccent,
//               //             borderRadius: BorderRadius.circular(20),
//               //           ),
//               //           height: 40,
//               //           width: 150,
//               //           alignment: Alignment.center,
//               //           child: Text(
//               //             text: "Continue",
//               //             color: Colors.black,
//               //             size: 16,
//               //             weight: FontWeight.bold,
//               //           ),
//               //         ),
//               //       )
//               //     ],
//               //   ),
//               // ),
//               SizedBox(
//                 height: 40,
//               ),
//               Text(
//                   text: "Learn More about these contents",
//                   size: 16,
//                   color: Colors.white30)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
