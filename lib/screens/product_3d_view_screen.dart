import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class Product3DViewScreen extends StatefulWidget {
  final String modelPath;

  const Product3DViewScreen({super.key, required this.modelPath});

  @override
  State<Product3DViewScreen> createState() => _Product3DViewScreenState();
}

class _Product3DViewScreenState extends State<Product3DViewScreen> {
  late ArCoreController arCoreController;
  bool isArCoreInitialized = false;

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    _addModel();
  }

  Future<void> _addModel() async {
    try {
      final node = ArCoreReferenceNode(
        name: "modelo_3d",
        objectUrl: widget.modelPath,
        position: vector.Vector3(0, 0, -1.5),
        scale: vector.Vector3(0.5, 0.5, 0.5),
      );

      arCoreController.addArCoreNode(node);
      setState(() {
        isArCoreInitialized = true;
      });
    } catch (e) {
      print('Erro ao carregar modelo: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualização 3D'),
      ),
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
        enableTapRecognizer: true,
        enablePlaneRenderer: true,
      ),
      floatingActionButton: isArCoreInitialized
          ? FloatingActionButton(
              onPressed: () {
                arCoreController.resume();
              },
              child: const Icon(Icons.refresh),
            )
          : null,
    );
  }
}