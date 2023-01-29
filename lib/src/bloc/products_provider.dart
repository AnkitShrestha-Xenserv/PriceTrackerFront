import 'package:flutter/material.dart';
import 'products_bloc.dart';
export 'products_bloc.dart';

class ProductsProvider extends InheritedWidget {
  final ProductsBloc bloc;
  ProductsProvider({Key? key, required Widget child})
      : bloc = ProductsBloc(),
        super(key: key, child: child);
  bool updateShouldNotify(_) => true;

  static ProductsBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProductsProvider>())!
        .bloc;
  }
}
