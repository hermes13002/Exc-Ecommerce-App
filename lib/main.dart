// ignore_for_file: prefer_const_constructors

import 'package:exc_ecomm/models/shop.dart';
import 'package:exc_ecomm/pages/cart_page.dart';
import 'package:exc_ecomm/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp()
    ), 
  );
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/homepage': (context) => HomePage(),
        '/cartpage': (context) => CartPage(),
      },
    );
  }
}

