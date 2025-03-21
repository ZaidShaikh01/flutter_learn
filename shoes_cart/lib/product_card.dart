import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String assetName;
  final int label;
  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.assetName,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: label % 2 == 0
              ? Color.fromRGBO(216, 240, 253, 1)
              : Color.fromRGBO(245, 247, 249, 1),
        ),
        child: Column(
          // First we need the title
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '\$$price',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 5,
            ),
            // This requires asset image name
            Center(
              child: Image.asset(
                assetName,
                height: 175,
              ),
            ),
          ],
        ));
  }
}
