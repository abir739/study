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
    ShopeScreen(),
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
      drawer: Drawer(
          backgroundColor: Colors.blue[900],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  DrawerHeader(
                    child: Image.asset(
                      'lib/images/Shop App.png',
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 27, left: 25),
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Colors.white,
                          size: 26,
                        ),
                        title: Text(
                          'Home',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )),
                  const Padding(
                    padding: EdgeInsets.only(top: 27, left: 25),
                    child: ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 26,
                      ),
                      title: Text(
                        'Settings',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Privacy and logout',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 27, left: 25),
                    child: ListTile(
                      leading: Icon(
                        Icons.support,
                        color: Colors.white,
                        size: 26,
                      ),
                      title: Text(
                        'Help & Support',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Help center and help legal terms',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 27, left: 25),
                    child: ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 26,
                      ),
                      title: Text(
                        'FAQ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Questions and Answe',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 27, left: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 26,
                  ),
                  title: Text(
                    'Sign Out',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )),
      body: _pages[_selectedIndex],
    );
  }
}
