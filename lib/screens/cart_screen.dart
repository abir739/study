import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/cart_item.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/models/user_cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserCart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Cart',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: value.getUserProducts().length,
              itemBuilder: (context, index) {
                Product userProduct = value.getUserProducts()[index];

                return CartItem(product: userProduct);
              },
            ))
          ],
        ),
      ),
    );
  }
}
