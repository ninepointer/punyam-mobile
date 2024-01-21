import 'package:flutter/material.dart';

class CartPageWidget extends StatefulWidget {
  @override
  _CartPageWidgetState createState() => _CartPageWidgetState();
}

class _CartPageWidgetState extends State<CartPageWidget> {
  // Sample data for demonstration
  List<CartItem> cartItems = [
    CartItem(
        name: 'Product 1',
        price: 20.0,
        imageUrl: 'https://example.com/product1.jpg'),
    CartItem(
        name: 'Product 2',
        price: 30.0,
        imageUrl: 'https://example.com/product2.jpg'),
    CartItem(
        name: 'Product 3',
        price: 25.0,
        imageUrl: 'https://example.com/product3.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return CartItemCard(cartItem: cartItems[index]);
        },
      ),
    );
  }
}

class CartItem {
  final String name;
  final double price;
  final String imageUrl;

  CartItem({required this.name, required this.price, required this.imageUrl});
}

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;

  CartItemCard({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(cartItem.imageUrl,
            width: 80, height: 80, fit: BoxFit.cover),
        title: Text(cartItem.name),
        subtitle: Text('₹${cartItem.price.toString()}'),
        trailing: IconButton(
          icon: Icon(Icons.remove_shopping_cart),
          onPressed: () {
            // Add your logic to remove the item from the cart
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${cartItem.name} removed from the cart'),
                duration: Duration(seconds: 2),
              ),
            );
          },
        ),
      ),
    );
  }
}
