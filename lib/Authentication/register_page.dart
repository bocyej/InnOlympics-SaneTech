import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:innolympics_sanetech/Authentication/login_page.dart';
import 'package:innolympics_sanetech/Authentication/register_page.dart';
import 'package:innolympics_sanetech/Authentication/reset_pw_page.dart';
import 'package:innolympics_sanetech/services/firestore.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final FirestoreService firestoreService = FirestoreService();
  String? errorMessage = '';
  String? errorMessageFireAuth = '';
  final _controllerFirstName = TextEditingController();
  final _controllerLastName = TextEditingController();
  final _controllerContactNumber = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _controllerConfirmPassword = TextEditingController();
  bool _obscurePasswordText = true;
  bool _obscureConfirmPasswordText = true;

  void signUp() async {
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
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _controllerEmail.text.trim(),
          password: _controllerPassword.text.trim(),
        );
        String userId = userCredential.user!.uid;

        firestoreService.createUser(
          uid: userId,
          firstName: _controllerFirstName.text,
          lastName: _controllerLastName.text,
          email: _controllerEmail.text,
          contactNumber: _controllerContactNumber.text,
        );
        // Hide loading indicator
        Navigator.pop(context);

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

  Widget titleText(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              text,
              style: TextStyle(color: Colors.blueGrey[900], fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String labelText,
      {bool obscureText = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
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
            return 'Please enter your $labelText';
          }
          return null;
        },
      ),
    );
  }

  Widget buildConfirmPasswordTextField(
      TextEditingController controller, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
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
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.blueGrey[900],
            ),
            onPressed: () {
              setState(() {
                _obscureConfirmPasswordText = !_obscureConfirmPasswordText;
              });
            },
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please confirm your Password';
          }
          if (value != _controllerPassword.text) {
            return 'Passwords do not match';
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Lets create you an Account!',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey.shade900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    'Fill out the form bellow',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey.shade900),
                  ),
                ),
                const SizedBox(height: 25),
                titleText('First Name'),
                buildTextField(_controllerFirstName, 'First Name'),
                const SizedBox(height: 16),
                titleText('Last Name'),
                buildTextField(_controllerLastName, 'Last Name'),
                const SizedBox(height: 16),
                titleText('Contact Number'),
                buildTextField(_controllerContactNumber, 'Contact Number'),
                const SizedBox(height: 16),
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
                titleText('Confirm Password'),
                buildConfirmPasswordTextField(
                    _controllerConfirmPassword, _obscureConfirmPasswordText),
                const SizedBox(height: 16),
                _submitLoginButton(),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member?",
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
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Login',
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
      ),
    );
  }

  Widget _submitLoginButton() {
    return GestureDetector(
      onTap: signUp,
      child: Container(
        padding: EdgeInsets.all(18),
        margin: EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey[900],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            'CREATE ACCOUNT',
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
