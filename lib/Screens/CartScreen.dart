import 'package:flutter/material.dart';
import 'package:one_store/Model/Product.dart';

import '../constants/api_const.dart';

class CartScreen extends StatefulWidget {
  final List<ProductResult> cartItems;

  const CartScreen({required this.cartItems});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add to Cart' , style: TextStyle(fontSize: 25),),centerTitle: true, ),
        body: widget.cartItems.isEmpty
            ? Center(child: Text('Cart Is Empty. . .', style: TextStyle(fontSize: 25),))
            : ListView.builder(itemBuilder: (context, index) {
                final product = widget.cartItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20),
                  child: ListTile(
                    leading: Image.network('$imageBaseUrl${product.images[0]}' , height: 300,),

                    title: Text(
                      product.name.toString(),
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Center(
                      child: Text(
                        'Rs: ${product.purchasePrice.toString()}/-',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.cartItems.remove(product);
                          });
                        },
                        icon: Icon(
                          Icons.delete,
                          size: 22,
                        )),
                  ),
                );
              }, itemCount: widget.cartItems.length,
              ),);
  }
}
