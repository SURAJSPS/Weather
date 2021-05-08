import 'package:flutter/material.dart';
import 'package:weather/home_page.dart';
import 'package:weather/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    );
  }
}
