import 'dart:convert';

import 'package:blog_app/model/article_model.dart';
import 'package:blog_app/model/category_model.dart';
import 'package:http/http.dart' as http;

class MainNews {
  List<ArticleModel> mainNews = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=640f7435fec643d6abdd8eb6de375859";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              publishedAt: element["publishedAt"],
              content: element["content"]);
          mainNews.add(articleModel);
        }
      });
    }
  }
}


class CategoryNews {
  List<CategoryModel> mainNews = [];

  Future<void> getNewsForCategory(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=640f7435fec643d6abdd8eb6de375859";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          CategoryModel categoryModel = CategoryModel(
              title: element['title'],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              publishedAt: element["publishedAt"],
              content: element["content"]);
          mainNews.add(categoryModel);
        }
      });
    }
  }
}