import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/models/user_cart_model.dart';

class CartItem extends StatefulWidget {
  Product product;
  CartItem({super.key, required this.product});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void removeItem() {
    Provider.of<UserCart>(context, listen: false)
        .removeProductFromList(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
      child: ListTile(
        leading: Image.asset(
          widget.product.image,
          width: 100,
          height: 120,
        ),
        title: Text(
          widget.product.name,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${widget.product.price} DT',
          style:
              TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Colors.blue[900],
          onPressed: removeItem,
        ),
      ),
    );
  }
}
