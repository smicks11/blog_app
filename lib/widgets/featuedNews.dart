// import 'package:blog_app/model/news.dart';
// import 'package:blog_app/helper/main_news.dart';
// import 'package:blog_app/model/article_model.dart';
import 'dart:async';

import 'package:blog_app/model/category_model.dart';
import 'package:blog_app/provider/provider.dart';
import 'package:blog_app/screens/detailscreen.dart';
// import 'package:blog_app/screens/homepage.dart';
// import 'package:blog_app/widgets/Text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedNews extends StatefulWidget {
  CategoryModel newsListBuild;

  final String category;

  FeaturedNews({@required this.newsListBuild, this.category});
  @override
  _FeaturedNewsState createState() => _FeaturedNewsState();
}

class _FeaturedNewsState extends State<FeaturedNews> {
  int offset = 0;
  int time = 800;
  bool _isLoading = true;
  Widget _featuredImageEffect() {
    offset += 5;
    time = 800 + offset;
    return Shimmer.fromColors(
      baseColor: Colors.grey[100],
      highlightColor: Colors.grey[50],
      period: Duration(milliseconds: time),
      child: ClipRRect(
        child: Image.network(
          widget.newsListBuild.urlToImage,
          height: 180,
          width: MediaQuery.of(context).size.width * 0.9,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget _featuredTextEffect() {
    offset += 5;
    time = 800 + offset;
    return Shimmer.fromColors(
      baseColor: Colors.grey[100],
      highlightColor: Colors.grey[50],
      period: Duration(milliseconds: time),
      child: Container(
        child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 300.0,
              maxWidth: 300.0,
              minHeight: 60.0,
              maxHeight: 100.0,
            ),
            child: Container(
              width: 38.0,
              height: 10.0,
              color: Colors.white,
            )),
      ),
    );
  }

  // List<ArticleModel> articles = List<ArticleModel>.empty(growable: true);
  // var newslist;

  // bool _loading = true;
  // @override
  // void initState() {
  //   super.initState();

  //   getCategoryNews();
  // }

  // getCategoryNews() async {
  //   // CategoryNews newsClass = CategoryNews();
  //   // await newsClass.getNews(widget.category);

  //   // articles = newsClass.mainNews;
  //   // setState(() {
  //   //   _loading = false;
  //   // });

  //   CategoryNews news = CategoryNews();
  //   await news.getNewsForCategory(widget.category);
  //   newslist = news.mainNews;
  //   // articles = newsClass.mainNews;
  //   setState(() {
  //     _loading = false;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   Timer timeCancel =
  // }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    Timer timer = Timer(Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
    DateTime time = DateTime.parse(widget.newsListBuild.publishedAt);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => DetailScreen(
                image: widget.newsListBuild.urlToImage,
                desc: widget.newsListBuild.description,
                authorName: widget.newsListBuild.author,
                date: widget.newsListBuild.publishedAt,
                headline: widget.newsListBuild.title)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        // height: 250,
        padding: EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _isLoading
                ? _featuredImageEffect()
                : LoadedImage(
                    getImage: widget.newsListBuild.urlToImage,
                    timer: timer,
                  ),
            SizedBox(
              height: 16,
            ),
            Column(
              children: [
                _isLoading
                    ? _featuredTextEffect()
                    : LoadedText(
                        getText: widget.newsListBuild.title,
                        timer: timer,
                      ),

                // SizedBox(
                //   height: 15,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          child: ClipRRect(
                            child: Image.network(
                              widget.newsListBuild.urlToImage,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 0.0,
                              maxWidth: 120.0,
                              minHeight: 15.0,
                              maxHeight: 40.0,
                            ),
                            child: Text(
                              widget.newsListBuild.author.toString(),
                              style: TextStyle(
                                fontSize: 15,
                                // color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                              
                            ),
                          ),
                        )
                      ],
                    ),
                    // SizedBox(width: 95),
                    Text(
                             timeago.format(time),
                              style: TextStyle(
                                fontSize: 12,
                                // color:  Colors.black26,
                                fontWeight: FontWeight.bold,
                      ),
                    )
                    
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
    //
  }
}

class LoadedImage extends StatefulWidget {
  final String getImage;
  final Timer timer;

  LoadedImage({this.timer, this.getImage});
  @override
  _LoadedImageState createState() => _LoadedImageState();
}

class _LoadedImageState extends State<LoadedImage> {
  @override
  Widget build(BuildContext context) {
    widget.timer.cancel();
    return ClipRRect(
      child: Image.network(
        widget.getImage,
        height: 180,
        width: MediaQuery.of(context).size.width * 0.9,
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(5),
    );
  }
}

class LoadedText extends StatefulWidget {
  final String getText;
  final Timer timer;

  LoadedText({this.timer, this.getText});
  @override
  _LoadedTextState createState() => _LoadedTextState();
}

class _LoadedTextState extends State<LoadedText> {
  @override
  Widget build(BuildContext context) {
    widget.timer.cancel();
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 300.0,
          maxWidth: 300.0,
          minHeight: 60.0,
          maxHeight: 100.0,
        ),
        child: AutoSizeText(
          widget.getText,
          style: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  // color: Colors.black
                  )),
          minFontSize: 20,
          maxLines: 2,
          // overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
