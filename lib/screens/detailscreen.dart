// import 'package:blog_app/helper/data.dart';
import 'package:blog_app/helper/main_news.dart';
import 'package:blog_app/model/category_model.dart';
// import 'package:blog_app/screens/homepage.dart';
// import 'package:blog_app/widgets/bottombar.dart';
// import 'package:blog_app/widgets/Text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:timeago/timeago.dart' as timeago;
// import 'package:comment_box/comment/comment.dart';

class DetailScreen extends StatefulWidget {
  // CategoryModel newsListBuild;

  final String image;
  final String authorImage;
  final String desc;
  final String authorName;
  final String date;
  final String headline;
  final String category;

  const DetailScreen(
      {Key key,
      @required this.image,
      this.authorImage,
      @required this.desc,
      @required this.authorName,
      @required this.date,
      @required this.headline,
      this.category})
      : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<CategoryModel> categories = List<CategoryModel>.empty(growable: true);

  CategoryModel categoryModel = CategoryModel();
  bool _loading = true;
  // void getNews() async {
  //   CategoryNews news = CategoryNews();
  //   await news.;
  //   newslist = news.news;
  //   setState(() {
  //     _loading = false;
  //   });
  // }
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
    categories = news.mainNews;
    // articles = newsClass.mainNews;
    setState(() {
      _loading = false;
    });
  }

  // Future<bool> _navBackPress() {
  //   return Navigator.of(context).push(MaterialPageRoute(
  //           builder: (ctx) => Homepage(
  //                 category: categoryModel.label,
  //               ))) ??
  //       false;
  // }

  //  final formKey = GlobalKey<FormState>();
  // final TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // print();
    DateTime time = DateTime.parse(widget.date);
    return Scaffold(
      body: _loading
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
              child: ListView(children: [
                Stack(alignment: Alignment.center, children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 1.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.image),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 10,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back,
                            // color: Colors.white, 
                            size: 24),
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Navigator.of(context, rootNavigator: true).pop(context);
                        },
                      ),
                    ),
                  ),
                ]),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                              widget.headline,
                              style: TextStyle(
                                fontSize: 20,
                                // color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              
                            ),
                      
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: ClipRRect(
                              child: Image.network(
                                widget.image,
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints: BoxConstraints(maxWidth: 200),
                                child: Text(
                              widget.authorName,
                              style: TextStyle(
                                fontSize: 16,
                                // color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                              
                            ),
                                
                              ),
                              Text(
                                timeago.format(time),
                                style: TextStyle(
                                  fontSize: 16,
                                  // color: Colors.black12,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                                "Follow",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                        
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    widget.desc,
                    style: TextStyle(
                      // color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                )
              ])),
      // bottomNavigationBar: BottomTab(),
    );
  }
}
