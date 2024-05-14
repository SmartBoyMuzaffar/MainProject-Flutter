import 'package:flutter/material.dart';

class Camera extends StatelessWidget {
  const Camera({super.key});

  static const routeName = '/camera';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Camera Control"),
      ),
      body: const Center(
        child: Text('Coming Soon...!'),
      ),
    );
  }
}

