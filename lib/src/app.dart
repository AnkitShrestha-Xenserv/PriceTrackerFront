import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/view_product.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  Widget build(context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: routes,
      title: 'Keen Price Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(body: LoginScreen()),
    );
  }

  Route routes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        {
          return MaterialPageRoute(builder: (context) {
            return LoginScreen();
          });
        }
      case '/login':
        {
          return MaterialPageRoute(builder: (context) {
            return LoginScreen();
          });
        }
      case '/register':
        {
          return MaterialPageRoute(builder: (context) {
            return RegisterScreen();
          });
        }
      case '/home':
        {
          return MaterialPageRoute(builder: (context) {
            return HomeScreen();
          });
        }
      case '/view_products':
        {
          return MaterialPageRoute(builder: (context) {
            return ViewProduct();
          });
        }
    }
    return MaterialPageRoute(builder: (context) {
      return LoginScreen();
    });
  }
}
