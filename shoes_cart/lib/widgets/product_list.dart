import 'package:flutter/material.dart';
import 'package:shoes_cart/global_variables.dart';
import 'package:shoes_cart/widgets/product_card.dart';
import 'package:shoes_cart/pages/product_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  // Creating a list of filters
  final List<String> filters = const [
    'All',
    'Nike',
    'Adidas',
    'Bata',
  ];
  late String selectedFilter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
    );

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Shoes\nCollection',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Here is the search at navigation top
              const Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border),
              )),
            ],
          ),
          // here we are going to use list view builder to create a list of filters

          SizedBox(
            height: 80,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        selectedFilter = filter;
                        setState(() {});
                      },
                      child: Chip(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        side: const BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context)
                                .primaryColor // We are using the primary key that we gave to our theme
                            : Color.fromRGBO(245, 247, 249, 1),
                        label: Text(filter),
                        labelStyle: const TextStyle(
                          //color: Colors.black,
                          //fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                }),
          ),

          Expanded(child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 600) {
              return GridView.builder(
                  itemCount: product.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 2),
                  itemBuilder: (context, index) {
                    final item = product[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return ProductPage(product: item);
                        }));
                      },
                      child: ProductCard(
                        title: item['title'] as String,
                        price: item['price'] as double,
                        assetName: item['imageUrl'] as String,
                        label: index,
                      ),
                    );
                  });
            } else {
              return ListView.builder(
                itemCount: product.length,
                itemBuilder: (context, index) {
                  final item = product[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ProductPage(product: item);
                      }));
                    },
                    child: ProductCard(
                      title: item['title'] as String,
                      price: item['price'] as double,
                      assetName: item['imageUrl'] as String,
                      label: index,
                    ),
                  );
                },
              );
            }
          }))

          // This is where we are returning the list of products
        ],
      ),
    );
  }
}
