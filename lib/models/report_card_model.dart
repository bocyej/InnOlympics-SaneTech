import 'package:flutter/material.dart';

class ReportCardModel {
  String title;
  String description;
  String time;

  ReportCardModel({
    required this.title,
    required this.description,
    required this.time,
  });

  static List<ReportCardModel> getReports() {
    List<ReportCardModel> reportcards = [];

    reportcards.add(
      ReportCardModel(
        title: 'Kidnapping in Malate',
        description: 'In the streets of Malate, Manila...',
        time: '8:50 AM',
      ),
    );

    reportcards.add(
      ReportCardModel(
        title: 'Phone Stolen in Paranaque',
        description: 'An elderly woman was taking a photo...',
        time: '11:25 PM',
      ),
    );

    reportcards.add(
      ReportCardModel(
        title: 'Thief stole items worth ₱100,000',
        description: 'Even though you have people around you...',
        time: '6:15 PM',
      ),
    );

    return reportcards;
  }
}
