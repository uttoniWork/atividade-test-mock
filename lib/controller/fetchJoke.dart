import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:atividade_test_mock/model/joke.dart';

Future<Joke> fetchJoke([client]) async {
  final response = await http
      .get(Uri.parse('https://v2.jokeapi.dev/joke/Any?lang=en&blacklistFlags=racist,sexist&type=twopart'));

  if (response.statusCode == 200) {
    return Joke.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to get a joke');
  }
}