import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:innolympics_sanetech/models/news_card_model.dart';

class NewsfeedPage extends StatefulWidget {
  const NewsfeedPage({super.key});

  @override
  State<NewsfeedPage> createState() => _NewsfeedPageState();
}

class _NewsfeedPageState extends State<NewsfeedPage> {
  List<NewsCardModel> newscard = [];

  bool _isCheckedCB1 = false;
  bool _isCheckedCB2 = false;
  bool _isCheckedCB3 = false;
  bool _isCheckedCB4 = false;
  bool _isCheckedCB5 = false;
  bool _isCheckedCB6 = false;

  void _getInitialInfo() {
    newscard = NewsCardModel.getNews();
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
            "Newsfeed",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: const Icon(
                  Icons.filter_alt_outlined,
                  color: Colors.black38,
                ),
              ),
            )
          ],
          scrolledUnderElevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                _newsList(),
              ],
            ),
          ),
        ),
        endDrawer: _endDrawerInfo(),
      ),
    );
  }

  Widget _newsList() {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height * 0.25,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              width: 1,
                              color: Colors.black38,
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(newscard[index].thumbnail),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  newscard[index].title,
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
                                  newscard[index].description,
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
              height: 15,
            )),
        itemCount: newscard.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }

  Widget _endDrawerInfo() {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: ListView(
          children: [
            const Text(
              "Filter Newsfeed",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            _otherFilter(),
            _categoryCheckButtons(),
            _resetFilterButton(),
            _filterNewsButton(),
          ],
        ),
      ),
    );
  }

  Widget _otherFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        children: [
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            child: const Text(
              "Trending",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryCheckButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Category",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                checkColor: Colors.white,
                value: _isCheckedCB1,
                onChanged: (bool? value) {
                  setState(() {
                    _isCheckedCB1 = value!;
                  });
                },
              ),
              const Text(
                "Drugs",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                checkColor: Colors.white,
                value: _isCheckedCB2,
                onChanged: (bool? value) {
                  setState(() {
                    _isCheckedCB2 = value!;
                  });
                },
              ),
              const Text(
                "Gun Shootings",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                checkColor: Colors.white,
                value: _isCheckedCB3,
                onChanged: (bool? value) {
                  setState(() {
                    _isCheckedCB3 = value!;
                  });
                },
              ),
              const Text(
                "Hold-Ups",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                checkColor: Colors.white,
                value: _isCheckedCB4,
                onChanged: (bool? value) {
                  setState(() {
                    _isCheckedCB4 = value!;
                  });
                },
              ),
              const Text(
                "Pick Pocket",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                checkColor: Colors.white,
                value: _isCheckedCB5,
                onChanged: (bool? value) {
                  setState(() {
                    _isCheckedCB5 = value!;
                  });
                },
              ),
              const Text(
                "Sexual Assaults",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                checkColor: Colors.white,
                value: _isCheckedCB6,
                onChanged: (bool? value) {
                  setState(() {
                    _isCheckedCB6 = value!;
                  });
                },
              ),
              const Text(
                "Snatcher",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _resetFilterButton() {
    return ElevatedButton(
      onPressed: () => Navigator.pop(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
      ),
      child: const Text(
        "Reset Filter",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _filterNewsButton() {
    return ElevatedButton(
      onPressed: () => Navigator.pop(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightBlue,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
      ),
      child: const Text(
        "Apply Filter",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
    );
  }
}
