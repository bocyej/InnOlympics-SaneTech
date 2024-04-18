import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:innolympics_sanetech/Authentication/register_page.dart';
import 'package:innolympics_sanetech/Authentication/reset_pw_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? errorMessage = '';
  String? errorMessageFireAuth = '';
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  bool _obscurePasswordText = true;

  void signIn() async {
    // Reset error message
    setState(() {
      errorMessageFireAuth = null;
    });

    // Validate the form before attempting sign-in
    if (_formKey.currentState!.validate()) {
      // Show loading indicator
      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(color: Colors.blueGrey[900]),
          );
        },
      );

      try {
        // Attempt sign-in with Firebase Auth
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _controllerEmail.text.trim(),
          password: _controllerPassword.text.trim(),
        );
        // Hide loading indicator
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        // Hide loading indicator
        Navigator.pop(context);
        setState(() {
          errorMessageFireAuth = e.code;
        });
        // Force validation to display the error message
        _formKey.currentState!.validate();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Welcome!',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.blueGrey.shade900),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'Login to Continue',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueGrey.shade900),
                ),
              ),
              const SizedBox(height: 25),
               Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
                  child: Row(
                    children: [
                      Text(
                        'Email',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.blueGrey[900]),
                      ),
                    ],
                  ),
                ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'example@mail.com',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey.shade800),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey.shade800),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red.shade900),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade900),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Email';
                      }
                      if (errorMessageFireAuth == 'user-not-found') {
                        return 'User not found';
                      }
                      if (errorMessageFireAuth == 'invalid-email') {
                        return 'Invalid Email Format';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Text(
                        'Password',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.blueGrey[900]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
                  child: TextFormField(
                    controller: _controllerPassword,
                    obscureText: _obscurePasswordText,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey.shade800),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey.shade800),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red.shade900),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade900),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePasswordText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.blueGrey[900],
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePasswordText = !_obscurePasswordText;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Password';
                      }
                      if (errorMessageFireAuth == 'wrong-password') {
                        return 'Invalid Email or Password';
                      }
                      return null;
                    },
                  ),
                ),
                // forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResetPasswordPage(),
                          ),
                        ),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                color: Colors.blueGrey.shade900,
                                offset: Offset(0, -2),
                              ),
                            ],
                            color: Colors.transparent,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _submitLoginButton(),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.blueGrey[900],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 14,
                          shadows: [
                            Shadow(
                              color: Colors.blueGrey.shade900,
                              offset: Offset(0, -2),
                            ),
                          ],
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _submitLoginButton() {
    return GestureDetector(
      onTap: signIn,
      child: Container(
        padding: EdgeInsets.all(18),
        margin: EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey[900],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            'LOG IN',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

