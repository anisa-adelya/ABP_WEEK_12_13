import 'package:flutter/material.dart';
import 'package:tugas_week12_1/W12_1/posts_model.dart';
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
    List posts = [];
    try {
      final response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          headers: {
            HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
          });

      //posts = json.decode(response.body);
      posts = parsePosts(response.body);
    } catch (err) {
      print(err);
    }

    return posts;
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
                    title: Text(snapshot.data![index].title),
                    subtitle: Text(snapshot.data![index].body),
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
