import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/httpServ.dart';
import 'dart:io';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(App());
}
