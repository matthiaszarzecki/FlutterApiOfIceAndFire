class Character {
  final String url;
  final String name;

  const Character({
    required this.url,
    required this.name,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      url: json['url'],
      name: json['name'],
    );
  }
}