// import 'package:blog_app/model/story_model.dart';
import 'package:blog_app/model/usermodel.dart';
import 'package:blog_app/screens/homepage.dart';
// import 'package:flutter/material.dart';



final User user = User(
  name: 'John Doe',
  profileImageUrl: 'https://wallpapercave.com/wp/AYWg3iu.jpg',
);
List<News> news = [
  News(
    url: "https://m.files.bbci.co.uk/modules/bbc-morph-news-waf-page-meta/5.1.0/bbc_news_logo.png",
     media: MediaType.image,
    duration: const Duration(seconds: 10),
    shortDesc: "Israel-Gaza: Fighting continues as truce hopes rise",
    fullDesc: "Dr Abu al-Ouf oversaw al-Shifa's hospital response to the coronavirus pandemicImage caption: Dr Abu al-Ouf oversaw al-Shifa's hospital response to the coronavirus pandemic\r\nWithout warning, an Israel…"
  ),
  News(
    url: "https://ichef.bbci.co.uk/news/1024/branded_news/8154/production/_118580133_mediaitem118580129.jpg",
     media: MediaType.image,
    duration: const Duration(seconds: 10),
    shortDesc: "Israel-Gaza: Hamas official predicts ceasefire 'within a day or two",
    fullDesc: "A Hamas official talks of a ceasefire"
  ),
  News(
    url: "https://ichef.bbci.co.uk/news/1024/branded_news/17E7F/production/_116491979_p093vcyt.jpg",
     media: MediaType.image,
    duration: const Duration(seconds: 10),
    shortDesc: "Republicans defy Trump to back Capitol riot probe",
    fullDesc: "Thirty-five Republicans sided with Democrats in the House of Representatives to set up a commission"
  ),
];

