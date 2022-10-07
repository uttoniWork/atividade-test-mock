import 'dart:async';

import 'package:atividade_test_mock/controller/fetchJoke.dart';
import 'package:atividade_test_mock/model/joke.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Joke> futureJoke;

  @override
  void initState() {
    super.initState();
    futureJoke = fetchJoke();
  }

  void refreshPage(){
    setState(() {
      futureJoke = fetchJoke();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[           
              FutureBuilder<Joke>(
                future: futureJoke,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text("A: " + snapshot.data!.setUp + "\n\nB: " + snapshot.data!.pun);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
              Container(
                margin: EdgeInsets.all(30.0),
                child: FloatingActionButton(
                  onPressed: refreshPage,
                  child: Icon(
                    Icons.refresh
                  )                   
                ),
              ),
            ]
          ),
        )
      ),
    );
  }
}