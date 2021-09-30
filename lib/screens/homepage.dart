import 'package:blog_app/helper/main_news.dart';
import 'package:blog_app/model/category_model.dart';
import 'package:blog_app/provider/provider.dart';
import 'package:blog_app/screens/interest_screen_two.dart';
// import 'package:blog_app/widgets/Text.dart';
import 'package:blog_app/widgets/featuedNews.dart';
import 'package:blog_app/widgets/popularnews.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// List<News> newsList = [
//   News(
//       image: "images/bg-5.jpeg",
//       headline: "Best fashion wear for women in 2018 by grammy's outit",
//       author: "Michelle Rodriguez",
//       time: "2 days ago",
//       authorImage: "images/author.jpeg"),
//   News(
//       image: "images/bg-5.jpeg",
//       headline: "Best fashion wear for women in 2018 by grammy's outit",
//       author: "Michelle Rodriguez",
//       time: "2 days ago",
//       authorImage: "images/author.jpeg"),
//   News(
//       image: "images/bg-5.jpeg",
//       headline: "Best fashion wear for women in 2018 by grammy's outit",
//       author: "Michelle Rodriguez",
//       time: "2 days ago",
//       authorImage: "images/author.jpeg"),
// ];
// List<News> popularList = [
//   News(
//       image: "images/bg-6.jpeg",
//       headline: "Fashion is in a flux",
//       author: "Rizvan",
//       time: "1 sept 2018",
//       desc: "In the past, Armani has gone too long way in the jackets"),
//   News(
//       image: "images/bg-6.jpeg",
//       headline: "Fashion is in a flux",
//       author: "Rizvan",
//       time: "1 sept 2018",
//       desc: "In the past, Armani has gone too long way in the jackets"),
//   News(
//       image: "images/bg-6.jpeg",
//       headline: "Fashion is in a flux",
//       author: "Rizvan",
//       time: "1 sept 2018",
//       desc: "In the past, Armani has gone too long way in the jackets"),
// ];

class Homepage extends StatefulWidget {
  final String category;

  const Homepage({Key key, this.category}) : super(key: key);

  // const Homepage(Key key, this.category) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with AutomaticKeepAliveClientMixin<Homepage> {
  List<CategoryModel> _categories = List<CategoryModel>.empty(growable: true);

  var newslist;

  bool _loading = true;
  @override
  void initState() {
    super.initState();

    getCategoryNews();
  }

  getCategoryNews() async {
    // CategoryNews newsClass = CategoryNews();
    // await newsClass.getNews(widget.category);

    // articles = newsClass.mainNews;
    // setState(() {
    //   _loading = false;
    // });

    CategoryNews news = CategoryNews();
    await news.getNewsForCategory(widget.category);
    _categories = news.mainNews;
    // articles = newsClass.mainNews;
    setState(() {
      _loading = false;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getNews();
  // }

  // void getNews() async {
  //   MainNews newsClass = MainNews();
  //   await newsClass.getNews();

  //   articles = newsClass.mainNews;
  //   setState(() {
  //     _loading = false;
  //   });
  // }

  // Future<Null> getNewsList() async {
  //   final response = await http.get(Uri.parse(url));
  //   final responseJson = json.decode(response.body);
  //   Iterable list = responseJson["articles"];

  //   setState(() {
  //     for (Map news in list) {
  //       _news.add(News.fromJson(news));
  //     }
  //   });
  // }

  // @override
  // void initState() {
  //   getNewsList();
  //   super.initState();
  // }

//   Future<bool> _onBackPressed() {
//   return showDialog(
//     context: context,
//     builder: (context) => new AlertDialog(
//       title: new Text('Are you sure?'),
//       content: new Text('Do you want to exit the App'),
//       actions: <Widget>[
//         new GestureDetector(
//           onTap: () => Navigator.of(context).pop(false),
//           child: Text(
//             text: "No",
//             color: Colors.black,
//             size: 16,
//           ),
//         ),
//         SizedBox(height: 16),
//         new GestureDetector(
//           onTap: () => Navigator.of(context).pop(true),
//           child: Text(
//             text: "Yes",
//             color: Colors.black,
//             size: 16,
//           ),
//         ),
//       ],
//     ),
//   ) ??
//       false;
// }

  Future<bool> _onBackPressed() {
    return Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => SecondInterestScreen())) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: SafeArea(
          child: _loading
              ? Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: SpinKitWanderingCubes(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                      duration: Duration(milliseconds: 1500),
                    ),
                  ),
                )
              : Container(
                  height: double.infinity,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 20),
                  child: ListView(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                                SecondInterestScreen()));
                                  },
                                  child: Container(
                                      width: 30,
                                      child: Image.asset("images/icon.png")),
                                ),
                                Checkbox(
                                    value: themeChange.darkTheme,
                                    onChanged: (bool value) {
                                      themeChange.darkTheme = value;
                                    })
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Featured",
                              style: TextStyle(
                                fontSize: 40,
                                // color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              
                            ),
                            
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Based on your interest",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black26,
                                fontWeight: FontWeight.bold,
                              ),
                              
                            ),
                            
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        height: 300,
                        width: double.infinity,
                        // color: Colors.blue,
                        child: ListView.builder(
                          itemCount: _categories.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return FeaturedNews(
                              newsListBuild: _categories[index],
                            );
                          },
                        ),
                      ),
                      Divider(),
                      Container(
                        height: 70,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                              height: 35,
                              width: 3,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                             "Top Headlines",
                              style: TextStyle(
                                fontSize: 24,
                                // color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              
                            ),
                            
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        // height: double.infinity,
                        // width: double.infinity,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (_, index) {
                            return PopularNews(
                                popularListBuild: _categories[index]);
                          },
                        ),
                      )
                    ],
                  ),
                ),
        ),
        // bottomNavigationBar: BottomTab(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// List<News> _news = [];

final String url =
    "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=640f7435fec643d6abdd8eb6de375859";

enum MediaType { image }

class News {
  final String image;
  final String headline;
  final String author;
  final String time;
  final String authorImage;
  final String fullDesc;
  final String shortDesc;
  final MediaType media;
  final Duration duration;
  final String url;

  News(
      {this.url,
      this.media,
      this.duration,
      this.shortDesc,
      this.fullDesc,
      this.authorImage,
      this.image,
      this.headline,
      this.author,
      this.time});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        image: json["urlToImage"],
        headline: json["title"],
        author: json["author"],
        time: json["publishedAt"],
        fullDesc: json["content"],
        shortDesc: json["description"],
        url: json["urlToImage"]);
  }
}
