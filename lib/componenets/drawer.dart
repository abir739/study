import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.inversePrimary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                  child: Icon(
                Icons.shopping_cart,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              )),
              const SizedBox(
                height: 20,
              ),
              // MyListTitle(icon: Icons.home, onTap: (){}, title: 'H O M E'),

              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: const Text(
                  'H O M E',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: Icon(
                  Icons.favorite,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: const Text(
                  'F A V O R I T E S',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: Icon(
                  Icons.shopping_bag,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: const Text(
                  'M Y C A R T',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: const Text(
                  'S E T T I N G S',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 25.0),
            child: Column(
              children: [
                Divider(),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('S I G N O U T'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
