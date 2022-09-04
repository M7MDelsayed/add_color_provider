import 'package:add_color_provider/Items/items.dart';
import 'package:add_color_provider/Items/product_item.dart';
import 'package:add_color_provider/Provider/notifier.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

class Catalog extends StatefulWidget {
  const Catalog({super.key});

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: const Text(
          "Catalog",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: [
          const SizedBox(
            width: 80,
          ),
          Consumer<CartNotifier>(builder: (context, cart, _) {
            return Badge(
              // alignment: Alignment.topCenter,
              position: BadgePosition.topStart(),
              badgeContent: Text(
                cart.selecteditems.length.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Cart(),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
              ),
            );
          })
        ],
      ),
      body: ListView.builder(
        itemCount: kItems.length,
        itemBuilder: (context, index) {
          final title = kItems[index];
          return ProductItem(
              title: title,
              onTabAdd: () {
                final cart = context.read<CartNotifier>();
                cart.addone(title);
              });
        },
      ),
    );
  }
}
