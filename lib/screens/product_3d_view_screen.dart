import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class Product3DViewScreen extends StatelessWidget {
  final String modelPath;
  
  const Product3DViewScreen({super.key, required this.modelPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Visualização 3D')),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8, // Altura ajustável
        child: Cube(
          onSceneCreated: (Scene scene) {
            scene.camera.position.z = 5; // Aproxime a câmera
            scene.world.add(
              Object(
                fileName: modelPath,
                scale: Vector3(2, 2, 2), // Aumente a escala do modelo
              ),
            );
          },
        ),
      ),
    );
  }
}