import 'package:flutter/material.dart';
import 'package:innolympics_sanetech/models/news_card_model.dart';

class NewsfeedPage extends StatefulWidget {
  const NewsfeedPage({super.key});

  @override
  State<NewsfeedPage> createState() => _NewsfeedPageState();
}

class _NewsfeedPageState extends State<NewsfeedPage> {
  List<NewsCardModel> newscard = [];

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
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter_alt),
            ),
          ],
          scrolledUnderElevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _newsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _newsList() {
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
                          width: MediaQuery.sizeOf(context).width * 0.85,
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
}
