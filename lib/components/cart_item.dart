import 'package:car_shop/components/car_tile.dart';
import 'package:car_shop/models/car.dart';
import 'package:car_shop/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  Car car;
  CartItem({super.key, required this.car});

  @override
  State<CartItem> createState() => _CartItemState();

}

class _CartItemState extends State<CartItem> {

  // remove item
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.car);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.car.imagePath),
        title: Text(widget.car.name),
        subtitle: Text(widget.car.price),
        trailing: IconButton(
          icon: Icon(Icons.delete), 
          onPressed: removeItemFromCart,

        )
      ),
    );
  }
}