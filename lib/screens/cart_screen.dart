import 'package:ecommerce_app/models/shop_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final myCart = context.watch<ShopModel>().getMyCartProducts();
    final shop = Provider.of<ShopModel>(context);
    final myCart = shop.getMyCartProducts();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title: const Center(
          child: Text(
            'My Cart',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
      body: myCart.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: myCart.length,
              itemBuilder: (context, index) {
                final cartItem = myCart[index];
                return ListTile(
                  leading: Image.asset(cartItem.image),
                  title: Text(cartItem.name),
                  subtitle: Text('\$${cartItem.price}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      shop.deleteProductFromCart(cartItem);
                    },
                  ),
                );
              },
            ),
    );
  }
}
