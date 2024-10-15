import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/models/user_cart_model.dart';
import 'package:shop_app/screens/products_card.dart';

class ShopeScreen extends StatefulWidget {
  const ShopeScreen({super.key});

  @override
  State<ShopeScreen> createState() => _ShopeScreenState();
}

class _ShopeScreenState extends State<ShopeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserCart>(
        builder: (context, value, child) => Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Search...',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      Icon(
                        Icons.search,
                        size: 25,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Text(
                    'Shop smart... Shop easy !',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Most Popular',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                      Text(
                        'see all',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.getProductsList().length,
                        itemBuilder: (context, index) {
                          Product product = value.getProductsList()[index];
                          return ProductCard(
                            product: product,
                          );
                        })),
                const Padding(
                  padding: EdgeInsets.only(top: 27.0, left: 27.0, right: 27),
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
              ],
            ));
  }
}
