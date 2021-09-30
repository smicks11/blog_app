import 'package:blog_app/helper/data.dart';
import 'package:blog_app/model/category_model.dart';
import 'package:blog_app/screens/pageview.dart';
// import 'package:blog_app/screens/categorynews.dart';
// import 'package:blog_app/screens/homepage.dart';
// import 'package:blog_app/screens/pageview.dart';
import 'package:blog_app/widgets/CustomText.dart';
// import 'package:blog_app/widgets/customtext.dart';
import 'package:flutter/material.dart';

class SecondInterestScreen extends StatefulWidget {
  @override
  _SecondInterestScreenState createState() => _SecondInterestScreenState();
}

class _SecondInterestScreenState extends State<SecondInterestScreen> {
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
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/bg-3.jpeg"),
          fit: BoxFit.fill,
        )),
        child: Container(
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
                      text: "Select your favorite\nnews categories",
                      size: 30,
                      color: Colors.white,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      mainAxisExtent: 40,
                      // childAspectRatio: 100 / 80,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 30,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, index) {
                      return InterestBoxes(
                        interestBox: categories[index].label,
                      );
                    }),
              ),
              SizedBox(
                height: 40,
              ),
              CustomText(
                  text: "Learn More about these contents",
                  size: 16,
                  color: Colors.white30)
            ],
          ),
        ),
      ),
    );
  }
}

class InterestBoxes extends StatefulWidget {
  final interestBox;

  const InterestBoxes({Key key, this.interestBox}) : super(key: key);

  @override
  _InterestBoxesState createState() => _InterestBoxesState();
}

class _InterestBoxesState extends State<InterestBoxes> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (ctx) => PageViewScreen(subCategory: widget.interestBox)));
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.white24)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomText(
            text: widget.interestBox,
            color: Colors.white,
            size: 18,
            weight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
