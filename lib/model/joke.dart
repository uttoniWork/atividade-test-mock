class Joke {
  final String setUp;
  final String pun;

  const Joke({
    required this.setUp,
    required this.pun,
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    
    return Joke(
      setUp: json['setup'],
      pun: json['delivery'],
    );
  }
}