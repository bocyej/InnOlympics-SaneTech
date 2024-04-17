import 'package:flutter/material.dart';

class EmergencyHotlinesPage extends StatefulWidget {
  const EmergencyHotlinesPage({super.key});

  @override
  State<EmergencyHotlinesPage> createState() => _EmergencyHotlinesPageState();
}

class _EmergencyHotlinesPageState extends State<EmergencyHotlinesPage> {
  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  _buildUI() {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Emergency Hotlines",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: _hotlinesInfo(),
      ),
    );
  }

  Widget _hotlinesInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Text("emergency hotlines"),
        ],
      ),
    );
  }
}
