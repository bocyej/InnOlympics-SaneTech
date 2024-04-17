import 'package:flutter/material.dart';
import 'package:innolympics_sanetech/models/report_card_model.dart';

class ReviewReportsPage extends StatefulWidget {
  const ReviewReportsPage({super.key});

  @override
  State<ReviewReportsPage> createState() => _ReviewReportsPageState();
}

class _ReviewReportsPageState extends State<ReviewReportsPage> {
  List<ReportCardModel> reportscard = [];

  void _getInitialInfo() {
    reportscard = ReportCardModel.getReports();
  }

  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  Widget _buildUI() {
    _getInitialInfo();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "View Reports",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: _reviewReportsInfo(),
      ),
    );
  }

  Widget _reviewReportsInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          DefaultTabController(
            length: 2, // length of tabs
            initialIndex: 0,
            child: Column(
              children: <Widget>[
                Container(
                  child: const TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black26,
                    tabs: [
                      Tab(
                        child: Text(
                          'Submit Reports',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'View Reports',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                    indicatorColor: Colors.black,
                  ),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.65,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  child: TabBarView(
                    children: <Widget>[
                      _tabOneInfo(),
                      _tabTwoInfo(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabOneInfo() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [],
      ),
    );
  }

  Widget _tabTwoInfo() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _viewReportCard(),
        ],
      ),
    );
  }

  _viewReportCard() {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  reportscard[index].title,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  reportscard[index].description,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: ((context, index) => const SizedBox(
              height: 0,
            )),
        itemCount: reportscard.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
