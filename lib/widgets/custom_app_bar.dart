import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Olá,',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            Text(
              'Yann Torres',
              style: TextStyle(
                fontSize: 24,
                color: Colors.deepPurple[300],
              ),
            ),
          ],
        ),
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.deepPurple,
              size: 28,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}