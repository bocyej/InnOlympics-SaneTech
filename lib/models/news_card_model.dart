import 'package:flutter/material.dart';

class NewsCardModel {
  String thumbnail;
  String title;
  String description;

  NewsCardModel({
    required this.thumbnail,
    required this.title,
    required this.description,
  });

  static List<NewsCardModel> getNews() {
    List<NewsCardModel> newscard = [];

    newscard.add(
      NewsCardModel(
        thumbnail: '',
        title: 'Kidnapping in Malate',
        description: 'In the streets of Malate, Manila...',
      ),
    );

    newscard.add(
      NewsCardModel(
        thumbnail: '',
        title: 'Phone Stolen in Paranaque',
        description: 'An elderly woman was taking a photo...',
      ),
    );

    newscard.add(
      NewsCardModel(
        thumbnail: '',
        title: 'Thief stole items worth ₱100,000',
        description: 'Even though you have people around you...',
      ),
    );

    return newscard;
  }
}
