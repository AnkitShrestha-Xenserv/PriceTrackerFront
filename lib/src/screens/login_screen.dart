import 'package:flutter/material.dart';
import '../components/button.dart';
import '../bloc/credentials_provider.dart';
import '../components/textField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bloc = CredentialsProvider.of(context);

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
                  StreamBuilder(
                      stream: bloc.username,
                      builder: (context, snapshot) {
                        return TextField(
                          onChanged: bloc.changeUsername,
                          decoration: InputDecoration(
                            hintText: 'Username',
                            contentPadding: const EdgeInsets.all(25.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.0),
                                borderRadius: BorderRadius.circular(5.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        );
                      }),
                  SizedBox(height: 5),
                  StreamBuilder(
                      stream: bloc.password,
                      builder: (context, snapshot) {
                        return TextField(
                          onChanged: bloc.changePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            contentPadding: const EdgeInsets.all(25.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.0),
                                borderRadius: BorderRadius.circular(5.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        );
                      }),
                  StreamBuilder(
                      stream: bloc.invalidCredentials,
                      builder: (context, snapshot) {
                        return Container(
                            child: Text(snapshot.hasData
                                ? snapshot.data.toString()
                                : ''));
                      }),
                  SizedBox(height: 80),
                  StreamBuilder(
                      stream: bloc.submitCredentialsvalid,
                      builder: (context, snapshot) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            minimumSize: const Size.fromHeight(50), // NEW
                          ),
                          onPressed: () {
                            if (snapshot.hasError) {
                              bloc.clearTextFields;
                            } else if (snapshot.hasData) {
                              Navigator.pushNamed(context, '/home');
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        );
                      }),
                  SizedBox(height: 20),
                  CustomButton(text: 'Sign up', route: '/register'),
                ],
              )),
        ],
      ),
    );
  }
}
