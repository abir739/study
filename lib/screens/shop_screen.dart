import 'package:ecommerce_app/componenets/drawer.dart';
import 'package:ecommerce_app/models/shop_model.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final ShopModel shop = ShopModel();
  String? selectedCategoryId;

  @override
  Widget build(BuildContext context) {
    final products = selectedCategoryId != null
        ? shop.getProductsByCategory(selectedCategoryId!)
        : shop.getAllProducts();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(
          child: Text(
            'Shoppe',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.wb_sunny))
        ],
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: shop.getCategories().length,
                itemBuilder: (context, index) {
                  final category = shop.getCategories()[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategoryId = category.id;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 80,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage(category.image),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(category.name),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ListTile(
                      leading: Image.asset(product.image),
                      title: Text(product.name),
                      subtitle: Text(product.description),
                    );
                  }))
        ],
      ),
    );
  }
}
