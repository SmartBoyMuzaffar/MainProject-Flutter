import 'package:flutter/material.dart';

class Auto extends StatelessWidget {
  const Auto({super.key});

  static const String routeName = '/auto';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Automation Control"),
      ),
      body: const Center(
        child: Text('Coming Soon...!'),
      ),
    );
  }
}

