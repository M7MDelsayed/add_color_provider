import 'package:add_color_provider/Items/cart_item.dart';
import 'package:add_color_provider/Provider/notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartNotifire = Provider.of<CartNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: const Text(
          "Cart",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: cartNotifire.selecteditems.isEmpty
          ? buildnodata()
          : buildcontent(cartNotifire),
    );
  }

  Widget buildnodata() {
    return const Center(
      child: Text("لا يوجد بيانات"),
    );
  }

  Widget buildcontent(CartNotifier cartNotifire) {
    return Container(
      color: Colors.yellow,
      width: double.infinity,
      child: ListView.builder(
        itemCount: cartNotifire.selecteditems.length,
        itemBuilder: (context, index) {
          return CartItem(
              onTabRemove: () {
                cartNotifire.removeone(cartNotifire.selecteditems[index]);
              },
              title: cartNotifire.selecteditems[index]);
        },
      ),
    );
  }
}
