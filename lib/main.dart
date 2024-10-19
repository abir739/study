import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:ecommerce_app/screens/intro_screen.dart';
import 'package:ecommerce_app/screens/shop_screen.dart';
import 'package:ecommerce_app/screens/themes/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/intro': (context) => const IntroScreen(),
        '/shop_screen': (context) => const ShopScreen(),
        '/my_cart': (context) => const MyCartScreen(),
      },
      home: const IntroScreen(),
      theme: lightMode,
    );
  }
}
