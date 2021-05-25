import 'package:blog_app/helper/data.dart';
import 'package:blog_app/helper/main_news.dart';
import 'package:blog_app/model/category_model.dart';
import 'package:blog_app/screens/homepage.dart';
import 'package:blog_app/widgets/bottombar.dart';
import 'package:blog_app/widgets/customtext.dart';
import 'package:flutter/material.dart';
// import 'package:comment_box/comment/comment.dart';

class DetailScreen extends StatefulWidget {
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
  List<CategoryModel> _categories = List<CategoryModel>.empty(growable: true);
  bool _loading = true;

  // @override
  // void initState() {
  //   super.initState();

  //   getCategoryNews();
  // }

  // getCategoryNews() async {
  //   CategoryNews news = CategoryNews();
  //   await news.getNewsForCategory(widget.category);
  //   _categories = news.mainNews;
  //   // articles = newsClass.mainNews;
  //   setState(() {
  //     _loading = false;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _categories = getCategories();
  }

  Future<bool> _navBackPress() {
    return Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => Homepage())) ??
        false;
  }

  //  final formKey = GlobalKey<FormState>();
  // final TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: _navBackPress,
      child: Scaffold(
        body: Container(
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
                      icon:
                          Icon(Icons.arrow_back, color: Colors.white, size: 24),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (ctx) => Homepage()));
                        // Navigator.of(context, rootNavigator: true).pop(context);
                      },
                    ),
                  ),
                ),
              ]),
              Container(
                height: 120,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(
                      text: widget.headline,
                      size: 30,
                      color: Colors.black,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 90,
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
                            CustomText(
                              text: widget.authorName,
                              size: 16,
                              color: Colors.black54,
                              weight: FontWeight.bold,
                            ),
                            CustomText(
                              text: widget.date,
                              size: 16,
                              color: Colors.black12,
                              weight: FontWeight.w600,
                            )
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
                      child: CustomText(
                          text: "Follow",
                          size: 17,
                          color: Colors.white,
                          weight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: CustomText(
                  text: widget.desc,
                  color: Colors.black,
                  size: 16,
                ),
              ),
              SizedBox(
                height: 5,
              )
            ])),
        bottomNavigationBar: BottomTab(),
      ),
    );
  }
}
