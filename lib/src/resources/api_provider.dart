import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

String _root = "http://10.0.2.2:5000";

class ApiProvider {
  Client client = Client();

  Future<List<ItemModel>> fetchProducts() async {
    var products = <ItemModel>[];
    print("Fetching products");
    print('==============');
    final response = await client.post(Uri.parse('$_root/fetchProduct'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8'
        },
        body: jsonEncode(<String, String>{
          'userId': '0',
        }));

    if (response.statusCode == 200) {
      final parsedJson = json.decode(response.body);
      for (var json in parsedJson) {
        products.add(ItemModel.fromJson(json));
      }
      return products;
    } else {
      print("Response Error");
    }
    return products;
  }

  Future<UserModel> login(String username, String password) async {
    UserModel user = UserModel();
    final response = await client.post(
      Uri.parse('$_root/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8'
      },
      body: jsonEncode(
        <String, String>{'username': username, 'password': password},
      ),
    );
    if (response.statusCode == 200) {
      final parsedJson = json.decode(response.body);
      user = UserModel.fromJson(parsedJson);
      return user;
    } else {
      print("Response Error");
    }
    return user;
  }

  Future<ItemModel> addProduct(String url, String thresholdPrice) async {
    ItemModel product = ItemModel();
    final response = await client.post(
      Uri.parse('$_root/addProduct'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8'
      },
      body: jsonEncode(
        <String, String>{
          'userId': '0',
          'url': '$url',
          'thresholdPrice': '$thresholdPrice',
        },
      ),
    );
    if (response.statusCode == 200) {
      final parsedJson = json.decode(response.body);
      product = ItemModel.fromJson(parsedJson);
      return product;
    } else {
      print("Response Error");
    }
    return product;
  }
}
