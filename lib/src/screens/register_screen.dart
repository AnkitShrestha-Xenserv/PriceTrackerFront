import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/textField.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = "", _password = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.35,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 100),
                  CustomTextField(
                    hintText: 'Username',
                    validate: (input) {},
                  ),
                  CustomTextField(
                    hintText: 'Password',
                    validate: (input) {},
                    obscureText: true,
                  ),
                  CustomTextField(
                    hintText: 'First Name',
                    validate: (input) {},
                  ),
                  CustomTextField(
                    hintText: 'Last Name',
                    validate: (input) {},
                  ),
                  CustomTextField(
                    hintText: 'Phone Number',
                    validate: (input) {},
                  ),
                  SizedBox(height: 80),
                  CustomButton(text: 'Register', route: '/login')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void validateUsername() {
    var input = "";
    if (input == null) {
      //return 'Invalid';
    }
    if (input.isEmpty) {
      //return 'Provide a username';
    }
    //return '';
  }
}
