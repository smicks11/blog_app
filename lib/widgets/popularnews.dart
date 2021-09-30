// import 'package:blog_app/model/news.dart';

import 'package:blog_app/model/category_model.dart';
import 'package:blog_app/screens/detailscreen.dart';
// import 'package:blog_app/widgets/Text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:auto_size_text/auto_size_text.dart';

class PopularNews extends StatefulWidget {
  CategoryModel popularListBuild;

  PopularNews({@required this.popularListBuild});

  @override
  _PopularNewsState createState() => _PopularNewsState();
}

class _PopularNewsState extends State<PopularNews> {
  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.parse(widget.popularListBuild.publishedAt);
    // print(timeago.format(time));
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => DetailScreen(
                image: widget.popularListBuild.urlToImage,
                desc: widget.popularListBuild.description,
                authorName: widget.popularListBuild.author,
                date: widget.popularListBuild.publishedAt,
                headline: widget.popularListBuild.title)));
      },
      child: Container(
        // margin: EdgeInsets.only(top: 12),
        height: MediaQuery.of(context).size.height * 0.2,
        width: double.infinity,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 300.0,
                        maxWidth: 300.0,
                        minHeight: 30.0,
                        maxHeight: 100.0,
                      ),
                      child: AutoSizeText(
                        widget.popularListBuild.title,
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                // color: Colors.black
                                )),
                        minFontSize: 16,
                        maxLines: 2,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),

                  Container(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 300.0,
                        maxWidth: 300.0,
                        minHeight: 60.0,
                        maxHeight: 100.0,
                      ),
                      child: AutoSizeText(
                        widget.popularListBuild.description,
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                // color: Colors.black26
                                )),
                        minFontSize: 13,
                        maxLines: 2,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),

                  // SizedBox(
                  //   height: 10,
                  // ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                              "By ${widget.popularListBuild.author}",
                              style: TextStyle(
                                fontSize: 14,
                                // color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                              
                            ),
                  
                      ),
                      SizedBox(
                          // width: 44,
                          ),
                      Container(
                          // width: 80,
                          child: Text(
                              timeago.format(time),
                              style: TextStyle(
                                fontSize: 12,
                                // color: Colors.black26,
                                fontWeight: FontWeight.bold,
                              ),
                              
                            ),
                          ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width,
                // height: 120,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16),
                // margin: EdgeInsets.only(right: 20),
                child: ClipRRect(
                  child: Image.network(
                    widget.popularListBuild.urlToImage,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
            // ClipRRect(
            //   child: Image.asset(
            //     widget.popularListBuild.image,
            //     height: 100,
            //     width: 80,
            //   ),
            //   borderRadius: BorderRadius.circular(20),
            // )
          ],
        ),
      ),
    );
  }
}
