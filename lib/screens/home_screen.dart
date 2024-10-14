import 'package:flutter/material.dart';
import 'package:shop_app/components/nav_bar.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/category_screen.dart';
import 'package:shop_app/screens/favorite_screen.dart';
import 'package:shop_app/screens/shope_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const ShopeScreen(),
    const FavoriteScreen(),
    const CategoryScreen(),
    const CartScreen(),
  ];
  void bottomnavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 224, 226),
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => bottomnavBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ));
        }),
        title: const Center(
            child: Text(
          "S H O P  A P P",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      drawer: Drawer(),
      body: _pages[_selectedIndex],
    );
  }
}
