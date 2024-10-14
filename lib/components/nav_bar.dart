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
          activeColor: const Color.fromARGB(255, 15, 81, 136),
          tabBackgroundColor: Colors.grey.shade400,
          tabActiveBorder: Border.all(color: Colors.white),
          // tabBorderRadius: 30,
          onTabChange: (value) => onTabChange!(value),
          tabs: const  [
            GButton(
              icon: Icons.home,
              text: 'Shop',
            ),
            GButton(
              icon: Icons.favorite,
              text: 'Favorite',
            ),
            GButton(
              icon: Icons.category,
              text: 'Categories',
            ),
            GButton(
              icon: Icons.shopping_bag,
              text: 'Cart',
            ),
          ]),
    );
  }
}
