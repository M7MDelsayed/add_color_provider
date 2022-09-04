import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final VoidCallback onTabRemove;
  final String title;
  const CartItem({
    Key? key,
    required this.onTabRemove,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: IconButton(
          onPressed: onTabRemove,
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
