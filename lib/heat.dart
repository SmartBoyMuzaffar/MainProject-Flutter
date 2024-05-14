import 'package:flutter/material.dart';

class Heat extends StatelessWidget {
  const Heat({super.key});

  static const routeName = '/heat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Heat Control"),
      ),
      body: const Center(
        child: Text('Coming Soon...!'),
      ),
    );
  }
}

