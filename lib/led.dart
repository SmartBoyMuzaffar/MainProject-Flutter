import 'package:flutter/material.dart';
import 'package:request/request.dart' as http;

class Led extends StatelessWidget {
  const Led({super.key, required this.title});

  final String title;
  static const routeName = '/led';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final _title = args['title'];
    final _description = args['description'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                // final url = Uri.parse('http://192.168.0.12/on');
                final url = Uri.parse('http://172.20.10.3/on');
                await url.request();
              },
              child: const Text("O N", style: TextStyle(color: Colors.green, fontSize: 50)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // final url = Uri.parse('http://192.168.0.12/off');
                final url = Uri.parse('http://172.20.10.3/off');
                await url.request();
              },
              child: const Text("O F F", style: TextStyle(color: Colors.red, fontSize: 50)),
            ),
          ],
        ),
      ),
    );
  }
}

