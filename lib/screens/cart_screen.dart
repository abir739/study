import 'package:ecommerce_app/models/shop_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          : Padding(
              padding: const EdgeInsets.all(12),
              // padding: const EdgeInsets.only(top: 20.0),
              child: ListView.builder(
                itemCount: myCart.length,
                itemBuilder: (context, index) {
                  final cartItem = myCart[index];
                  // return Container(
                  //   decoration: BoxDecoration(
                  //     color: Theme.of(context).colorScheme.primary,
                  //     borderRadius: BorderRadius.circular(12),
                  //   ),
                  //   margin: const EdgeInsets.all(10),
                  //   padding: const EdgeInsets.all(20),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         flex: 1,
                  //         child: Image.asset(
                  //           cartItem.image,
                  //           fit: BoxFit.cover,
                  //         ),
                  //       ),
                  //       const SizedBox(width: 10),
                  //       Expanded(
                  //         flex: 2,
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text(
                  //               cartItem.name,
                  //               style: const TextStyle(
                  //                   fontWeight: FontWeight.bold),
                  //             ),
                  //             Text(
                  //               '\$${cartItem.price.toString()}',
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       // Trailing icons
                  //       Row(
                  //         mainAxisSize: MainAxisSize.min,
                  //         children: [
                  //           IconButton(
                  //             icon: Icon(
                  //               Icons.payment,
                  //               color: Theme.of(context)
                  //                   .colorScheme
                  //                   .inversePrimary,
                  //             ),
                  //             onPressed: () {
                  //               // Implement payment functionality here
                  //             },
                  //           ),
                  //           IconButton(
                  //             icon: Icon(
                  //               Icons.delete,
                  //               color: Theme.of(context)
                  //                   .colorScheme
                  //                   .inversePrimary,
                  //             ),
                  //             onPressed: () {
                  //               shop.deleteProductFromCart(cartItem);
                  //             },
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // );

                  return Card(
                    elevation: 5, // Adjust elevation as needed
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.asset(
                              cartItem.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartItem.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                
                                Text(
                                  '\$${cartItem.price.toString()}',
                                ),
                              ],
                            ),
                          ),
                          // Trailing icons
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.payment,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                                onPressed: () {
                                  // Implement payment functionality here
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                                onPressed: () {
                                  shop.deleteProductFromCart(cartItem);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
