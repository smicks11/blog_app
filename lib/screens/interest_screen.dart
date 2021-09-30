import 'package:blog_app/helper/data.dart';
import 'package:blog_app/model/category_model.dart';
// import 'package:blog_app/screens/categorynews.dart';
// import 'package:blog_app/screens/homepage.dart';
import 'package:blog_app/screens/pageview.dart';
import 'package:blog_app/widgets/CustomText.dart';
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
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text:
                                "What type of news interests you at the moment?",
                            size: 28,
                            color: Colors.black,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          CustomText(
                            text:
                                "Select 1 news category type you'd like to\nread about",
                            size: 17,
                            color: Colors.black45,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    SingleChildScrollView(
                        // height: double.infinity,
                        child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
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
            builder: (ctx) =>
                PageViewScreen(subCategory: widget.categoryName)));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Card(
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 8),
            height: 80,
            // width: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                // Expanded(
                //   flex: 1,
                //   child: Icon(Icons.access_alarm_sharp, size: 20,)),
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: widget.categoryName,
                    size: 20,
                    color: Colors.black54,
                    weight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.purpleAccent,
                  size: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
