import 'package:atividade_test_mock/controller/fetchJoke.dart';
import 'package:atividade_test_mock/model/joke.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'Joke_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('returns a joke if successfull', () async {
    final client = MockClient();

    when(client.get(Uri.parse('https://v2.jokeapi.dev/joke/Any?lang=en&blacklistFlags=racist,sexist&type=twopart')))
      .thenAnswer((_) async => http.Response('{"setup": "perguntinha besta?", "delivery": "respostinha à altura"}', 200)
    );

    expect(await fetchJoke(client), isA<Joke>());
  });
}