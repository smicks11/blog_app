import 'package:blog_app/helper/data.dart';
import 'package:blog_app/model/category_model.dart';
import 'package:blog_app/screens/categorynews.dart';
import 'package:blog_app/screens/homepage.dart';
import 'package:blog_app/widgets/customtext.dart';
import 'package:flutter/material.dart';

class InterestScreen extends StatefulWidget {
  @override
  _InterestScreenState createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  List<CategoryModel> categories = List<CategoryModel>.empty(growable: true);

  CategoryModel categoryModel = CategoryModel();
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
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    print(categories.length);
    return Scaffold(
      backgroundColor: Colors.grey[250],
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text:
                              "What category of news\ninterests you at the moment?",
                          size: 30,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 1500,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: categories.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                              categoryName: categories[index].label);
                        },
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatefulWidget {
  // CategoryModel interestBuild;
  final categoryName;

  const CategoryCard({Key key, this.categoryName}) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  CategoryModel interestBuild;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (ctx) => Homepage(
                  category: widget.categoryName,
                )));
      },
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 100,
        // width: double.infinity,
        decoration: BoxDecoration(
          // shape: BoxShape.rectangle,
          // color: Colors.white,
          // borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            CustomText(text: widget.categoryName, size: 22, color: Colors.black)
          ],
        ),
      ),
    );
  }
}
