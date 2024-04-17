import 'package:flutter/material.dart';

class NewsfeedPage extends StatefulWidget {
  const NewsfeedPage({super.key});

  @override
  State<NewsfeedPage> createState() => _NewsfeedPageState();
}

class _NewsfeedPageState extends State<NewsfeedPage> {
  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  _buildUI() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Text("newsfeed"),
          ],
        ),
      ),
    );
  }
}
