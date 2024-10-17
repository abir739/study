import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Themes/theme.dart';
import 'package:shop_app/Themes/theme_provider.dart';
import 'package:shop_app/models/user_cart_model.dart';
import 'package:shop_app/screens/intro_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(primaryColor: Colors.blue),
    //   home: const IntroScreen(),
    // );

    return ChangeNotifierProvider(
      create: (context) => UserCart(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroScreen(),
        theme: Provider.of<ThemeProvider>(context).themeData,
        // theme: lightMode,
        // darkTheme: darkMode,
      ),
    );
  }
}
