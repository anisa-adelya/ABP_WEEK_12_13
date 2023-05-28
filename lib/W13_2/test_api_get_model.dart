import 'package:flutter/material.dart';
import 'package:tugas_week12_1/W13_2/products_model.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Layout 1',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List> _loadData() async {
    List products = [];
    try {
      final response = await http.get(
          Uri.parse('http://103.67.187.87/telu_laravel_08/public/api/products'),
          headers: {
            HttpHeaders.authorizationHeader:
                'Bearer 9|2jxjlJ43QUrYp17n2ou0tCDcVyeJwobm4USnarxz',
          });

      //posts = json.decode(response.body);
      products = parseProducts(response.body);
    } catch (err) {
      print(err);
    }

    return products;
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fetch Data Example')),
      body: FutureBuilder(
        future: _loadData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  // render list item
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    title: Text(snapshot.data![index].name),
                    subtitle: Text(snapshot.data![index].price.toString()),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
