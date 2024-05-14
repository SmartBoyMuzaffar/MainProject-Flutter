import 'package:flutter/material.dart';

class Door extends StatelessWidget {
  const Door({super.key});

  static const String routeName = '/door';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Door Control"),
      ),
      body: const Center(
        child: Text('Coming Soon...!'),
      ),
    );
  }
}

