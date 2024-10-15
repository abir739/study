import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GNav(
          // color: Colors.grey,
          activeColor: Colors.blue[900],
          tabBackgroundColor: Colors.grey.shade400,
          tabActiveBorder: Border.all(color: Colors.white),
          // tabBorderRadius: 30,
          onTabChange: (value) => onTabChange!(value),
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Shop',
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blue[900]),
            ),
            GButton(
              icon: Icons.favorite,
              text: 'Favorite',
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blue[900]),
            ),
            GButton(
              icon: Icons.category,
              text: 'Categories',
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blue[900]),
            ),
            GButton(
              icon: Icons.shopping_bag,
              text: 'Cart',
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blue[900]),
            ),
          ]),
    );
  }
}
