// import 'package:flutter/material.dart';

import 'package:blog_app/model/story_model.dart';

enum MediaType { image }

class CategoryModel {
  String label;
  bool isSelected;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;
  final String publishedAt;
  final MediaType media;
  final Duration duration;


  CategoryModel({this.media, this.duration, this.author, this.title, this.description, this.url, this.urlToImage, this.content, this.publishedAt, this.label, this.isSelected = false});

  // CategoryModel copy({
  //   String label,
  //   bool isSelected,
  // }) =>
  //     CategoryModel(
  //         label: label ?? this.label,
  //         isSelected: isSelected ?? this.isSelected,
  //         );

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is CategoryModel &&
  //         runtimeType == other.runtimeType &&
  //         label == other.label &&
  //         isSelected == other.isSelected;

  // @override
  // int get hashCode =>
  //     label.hashCode ^  isSelected.hashCode ;
}
