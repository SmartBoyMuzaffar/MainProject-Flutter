import 'package:flutter/material.dart';

class Temp extends StatelessWidget {
  const Temp({super.key});

  static const routeName = '/temp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temperature Control"),
      ),
      body: const Center(
        child: Text('Coming Soon...!'),
      ),
    );
  }
}

