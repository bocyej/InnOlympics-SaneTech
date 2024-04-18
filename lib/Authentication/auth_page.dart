import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:innolympics_sanetech/Authentication/login_page.dart';
import 'package:innolympics_sanetech/screens/home_page.dart';
import 'package:innolympics_sanetech/widget_tree.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('Navigating to HomePage');
            return WidgetTree();
          } else {
            print('Navigating to LoginPage');
            return LoginPage();
          }
        },
      ),
    );
  }
}
