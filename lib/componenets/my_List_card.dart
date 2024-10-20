import 'package:flutter/material.dart';

class MyListCard extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final String price;
  const MyListCard(
      {super.key,
      required this.description,
      required this.image,
      required this.name,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              width: 100,
            ),
          ),
          Expanded(
            child: Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            price,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ],
      ),
    );
  }
}
