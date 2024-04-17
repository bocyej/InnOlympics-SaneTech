import 'package:flutter/material.dart';
import 'package:innolympics_sanetech/models/report_card_model.dart';
import 'package:innolympics_sanetech/screens/review_reports.dart';

class SubmitReportsPage extends StatefulWidget {
  const SubmitReportsPage({super.key});

  @override
  State<SubmitReportsPage> createState() => _SubmitReportsPageState();
}

class _SubmitReportsPageState extends State<SubmitReportsPage> {
  List<ReportCardModel> reportscard = [];

  void _getInitialInfo() {
    reportscard = ReportCardModel.getReports();
  }

  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  _buildUI() {
    _getInitialInfo();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Reports",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReviewReportsPage()),
                );
              },
              child: const Text(
                "View Reports",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        body: _submitReportInfo(),
      ),
    );
  }

  Widget _submitReportInfo() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Text(
            "data",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
