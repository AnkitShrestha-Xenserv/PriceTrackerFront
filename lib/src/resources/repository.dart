import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../models/user_model.dart';
import 'api_provider.dart';
import 'dart:io';

class Repository {
  static final apiProvider = ApiProvider();

  Future<List<ItemModel>> fetchProducts() async {
    print("Fetching products...");
    //if (await checkConnectivity()) {
    final list = await apiProvider.fetchProducts();
    return list;
    //}
    //return list;
  }

  Future<ItemModel> addProduct(url, thresholdPrice) async {
    return apiProvider.addProduct(url, thresholdPrice);
  }

  Future<UserModel> login(username, password) async {
    return apiProvider.login(username, password);
  }

  Future<bool> checkConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('Internet');
        return true;
      }
    } on SocketException catch (_) {
      print('No Internet');
      return false;
    }
    return false;
  }
}
