import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_cart/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    //print(Provider.of<String>(context));  // Went up to the provider String
    final cart = context.watch<CartProvider>().cart;
    //final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final cartItem = cart[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(cartItem['imageUrl'] as String),
                  radius: 30,
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: Text(
                                'Delete Product',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              content: Text('Are you sure you want to delete?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Read is like you read it and leave it

                                    
                                    context.read<CartProvider>()
                                        .removeProduct(cartItem);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Yes',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ), 
                                  ),
                                )
                              ]);
                        });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                title: Text(
                  cartItem['title'].toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                subtitle: Text('Size: ${cartItem['size']}'),
              );
            }));
  }
}
