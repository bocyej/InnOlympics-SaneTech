import 'package:flutter/material.dart';

class SubmitReportsPage extends StatefulWidget {
  const SubmitReportsPage({super.key});

  @override
  State<SubmitReportsPage> createState() => _SubmitReportsPageState();
}

class _SubmitReportsPageState extends State<SubmitReportsPage> {
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
            Text("submit reports"),
          ],
        ),
      ),
    );
  }
}
