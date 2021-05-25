// import 'package:flutter/material.dart';
import 'package:blog_app/model/usermodel.dart';
// import 'package:meta/meta.dart';



enum MediaType { image }

class Story {
  final String url;
  final Duration duration;
  final MediaType media;
   final User user;


  Story({this.url, this.duration, this.media, this.user});
}
