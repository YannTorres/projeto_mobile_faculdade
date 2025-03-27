import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Product> products = [
    Product(
      name: 'Produto 1',
      description: 'Descrição do Produto 1',
      price: 29.99,
      imageUrl: 'lib/assets/notebook.jpg',
    ),
    Product(
      name: 'Produto 2',
      description: 'Descrição do Produto 2',
      price: 49.99,
      imageUrl: 'lib/assets/notebook.jpg',
    ),
    Product(
      name: 'Produto 3',
      description: 'Descrição do Produto 3',
      price: 19.99,
      imageUrl: 'lib/assets/notebook.jpg',
    ),
    // Adicione mais produtos aqui...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CustomAppBar(),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Pesquisar...',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Conteúdo da tela inicial
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Dois cards por linha
                  crossAxisSpacing: 16, // Espaçamento horizontal entre os cards
                  mainAxisSpacing: 16, // Espaçamento vertical entre os cards
                  childAspectRatio: 0.89, // Proporção de aspecto dos cards (largura/altura)
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(product: product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}