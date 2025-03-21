import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final Map<String, Object> product;

  const ProductPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          // Showing the above text
          Text(
            product['title'] as String,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(product['imageUrl'] as String),
          ),
          const Spacer(
            flex: 2,
          ),
          // Here I want a container with it's own color
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: const Color.fromRGBO(245, 247, 249, 1),
            ),
            child: Column(
              children: [
                p
              ],
            ),
          )
        ],
      )),
    );
  }
}
