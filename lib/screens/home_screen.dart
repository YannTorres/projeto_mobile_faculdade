import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Product> products = [
    Product(
      name: 'Almofada',
      description: 'Estampada',
      details: 'Transforme sua casa com essa almofada, perfeita para quem busca sofisticação e aconchego. Feita com tecido aveludado de alta qualidade e enchimento super macio, ela proporciona máximo conforto para seus momentos de descanso. Com design moderno e diversas opções de cores, combina perfeitamente com qualquer decoração.',
      price: 29.99,
      imageUrl: 'lib/assets/notebook.jpg',
    ),
    Product(
      name: 'Notebook',
      description: 'Samsumg',
      details: 'Escolha ideal para quem busca desempenho e praticidade. Equipado com um processador Intel Core i7 de última geração, 16GB de RAM e SSD de 512GB, ele garante velocidade e eficiência para multitarefas, estudos e até mesmo games leves.',
      price: 999.99,
      imageUrl: 'lib/assets/notebook.jpg',
    ),
    Product(
      name: 'Celular',
      description: 'Samsung',
      details: 'Dispositivo projetado para quem busca desempenho e estilo. Com uma tela AMOLED de 6.7" e taxa de atualização de 120Hz, você terá uma experiência visual fluida e imersiva. Equipado com um processador octa-core de alto desempenho, 8GB de RAM e 256GB de armazenamento, ele permite rodar aplicativos pesados com facilidade.',
      price: 1999.99,
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