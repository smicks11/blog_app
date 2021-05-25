// import 'package:blog_app/model/news.dart';
import 'package:blog_app/helper/main_news.dart';
import 'package:blog_app/model/article_model.dart';
import 'package:blog_app/model/category_model.dart';
import 'package:blog_app/screens/detailscreen.dart';
// import 'package:blog_app/screens/homepage.dart';
import 'package:blog_app/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:auto_size_text/auto_size_text.dart';

class FeaturedNews extends StatefulWidget {
  CategoryModel newsListBuild;

  final String category;

  FeaturedNews({@required this.newsListBuild, this.category});
  @override
  _FeaturedNewsState createState() => _FeaturedNewsState();
}

class _FeaturedNewsState extends State<FeaturedNews> {
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

  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.parse(widget.newsListBuild.publishedAt);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
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
            ClipRRect(
              child: Image.network(
                widget.newsListBuild.urlToImage,
                height: 180,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              children: [
                Container(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 300.0,
                      maxWidth: 300.0,
                      minHeight: 60.0,
                      maxHeight: 100.0,
                    ),
                    child: AutoSizeText(
                      widget.newsListBuild.title,
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.black)),
                      minFontSize: 20,
                      maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
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
                              minWidth: 30.0,
                              maxWidth: 120.0,
                              minHeight: 30.0,
                              maxHeight: 30.0,
                            ),
                            child: CustomText(
                              text: widget.newsListBuild.author.toString(),
                              size: 15,
                              color: Colors.black54,
                              weight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    // SizedBox(width: 95),
                    CustomText(
                      text: timeago.format(time),
                      size: 12,
                      color: Colors.black26,
                      weight: FontWeight.bold,
                    ),
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
