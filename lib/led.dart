import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'package:request/request.dart';
import 'package:http/http.dart' as http;

// #############################################################################
// class DataBase {
//   // id required
//   // final int id = 001;
//   final String id="001";
//   late String ip;
//
//   connect() async {
//     final conn = await Connection.open(Endpoint(
//       host: 'dpg-cnlujkol5elc73cb0e20-a.oregon-postgres.render.com',
//       database: 'pgdb_y28n',
//       username: 'postgresql',
//       password: 'oW0Al1JPI03FikwBTkAQcX4d5STstWy0',
//
//     ));
//     ip = (await conn.execute("SELECT ip_address FROM esp32_ip WHERE id = $id")) as String;
//     await conn.close();
//     return ip;
//   }
// }
// // #############################################################################
class DataBase {
  final String id = "11111111111";
  late String ip;

  Future<String> connect() async {
    final conn = PostgreSQLConnection(
      'dpg-cnlujkol5elc73cb0e20-a.oregon-postgres.render.com',
      5432,
      'kafolat',
      username: 'postgresql',
      password: 'oW0Al1JPI03FikwBTkAQcX4d5STstWy0',
      useSSL: true,
    );

    try {
      await conn.open();
      List<List<dynamic>> results = await conn.query(
        "SELECT s_ip FROM ip_address WHERE s_id = @id",
        substitutionValues: {'id': id},
      );
      await conn.close();

      if (results.isNotEmpty) {
        ip = results[0][0];
        return ip;
      } else {
        throw Exception('IP address not found for ID $id');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

}
// #############################################################################


class Led extends StatelessWidget {
  const Led({super.key, required this.title});

  final String title;
  static const routeName = '/led';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final _title = args['title'];
    final _description = args['description'];

    print("Trying to connect to database");
    DataBase db = DataBase();
    db.connect();
    print("Connected to database");

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
                DataBase db = DataBase();
                final ipAddress = await db.connect();
                final url = Uri.parse('http://$ipAddress/on');
                await url.request();
              },
              child: const Text("O N", style: TextStyle(color: Colors.green, fontSize: 50)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                DataBase db = DataBase();
                final ipAddress = await db.connect();
                final url = Uri.parse('http://$ipAddress/off');
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

