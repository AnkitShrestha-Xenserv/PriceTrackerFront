import 'package:flutter/material.dart';
import 'package:price_tracker/src/screens/add_product.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/view_product.dart';
import 'screens/add_product.dart';
import 'bloc/credentials_provider.dart';
import 'bloc/credentials_bloc.dart';
import 'bloc/products_provider.dart';
import 'bloc/products_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  Widget build(context) {
    print("Start");
    return CredentialsProvider(
      child: ProductsProvider(
        child: MaterialApp(
          initialRoute: '/',
          onGenerateRoute: routes,
          title: 'Keen Price Tracker',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: Scaffold(body: HomeScreen()),
        ),
      ),
    );
  }

  Route routes(RouteSettings settings) {
    print("Routes");
    switch (settings.name) {
      case '/':
        {
          print("default");
          return MaterialPageRoute(builder: (context) {
            final _bloc = ProductsProvider.of(context);
            _bloc.fetchProducts();
            return HomeScreen();
          });
        }
      case '/login':
        {
          print("Login");
          return MaterialPageRoute(builder: (context) {
            final _bloc = ProductsProvider.of(context);
            _bloc.fetchProducts();
            return LoginScreen();
          });
        }
      case '/register':
        {
          print("Register");
          return MaterialPageRoute(builder: (context) {
            return RegisterScreen();
          });
        }
      case '/home':
        {
          print("home");
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
      case '/add_products':
        {
          return MaterialPageRoute(builder: (context) {
            return AddProduct();
          });
        }
    }
    return MaterialPageRoute(builder: (context) {
      return HomeScreen();
    });
  }
}
