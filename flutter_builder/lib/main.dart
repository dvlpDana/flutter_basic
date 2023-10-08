import 'package:flutter/material.dart';
import 'package:flutter_builder/screen/home_screen.dart';
import 'package:flutter_builder/screen/stream_screen.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => HomeScreen(),
        '/stream_widget' : (context) => StreamScreen()
      },
    ),
  );
}
