import 'package:ecommerce_app/componenets/drawer.dart';
import 'package:ecommerce_app/componenets/my_List_card.dart';
import 'package:ecommerce_app/models/shop_model.dart';
import 'package:flutter/material.dart';
import 'package:group_grid_view/group_grid_view.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
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
                        width: 70,
                        height: 70,
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Colors.white,
                              ),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage(category.image),
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              category.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            const Text(
              'Our Products Items',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            // Expanded(
            //     child: ListView.builder(
            //         itemCount: products.length,
            //         itemBuilder: (context, index) {
            //           final product = products[index];
            //           return ListTile(
            //             leading: Image.asset(product.image),
            //             title: Text(product.name),
            //             subtitle: Text(product.description),
            //           );
            //         })),
            Expanded(
                child: GroupGridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              sectionCount: 1,
              itemInSectionCount: (section) => products.length,
              itemInSectionBuilder: (context, indexPath) {
                final product = products[indexPath.index];
                // return ListTile(
                //   leading: Image.asset(product.image),
                //   title: Text(product.name),
                //   subtitle: Text(product.description),
                // );
                return MyListCard(
                    description: product.description,
                    image: product.image,
                    name: product.name,
                    price: product.price);
              },
            ))
          ],
        ),
      ),
    );
  }
}
