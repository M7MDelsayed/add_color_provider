import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final VoidCallback onTabAdd;

  const ProductItem({
    super.key,
    required this.title,
    required this.onTabAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          MaterialButton(
            onPressed: onTabAdd,
            child: const Text(
              "ADD",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
