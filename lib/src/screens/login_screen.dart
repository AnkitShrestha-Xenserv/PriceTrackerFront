import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/textField.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
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
          Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Keen Price Tracker',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 100),
                  CustomTextField(hintText: 'Username'),
                  SizedBox(height: 5),
                  CustomTextField(hintText: 'Password', obscureText: true),
                  SizedBox(height: 80),
                  CustomButton(text: 'Login', route: '/home'),
                  SizedBox(height: 20),
                  CustomButton(text: 'Sign up', route: '/register'),
                ],
              )),
        ],
      ),
    );
  }
}
