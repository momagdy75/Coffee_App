

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/splash_screen.dart';
import 'constant.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    home: SplashScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: bgtwoColor)
      ),
    );
  }
}
