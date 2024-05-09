class Poke {
  String? name;
  String? url;
  String? imageUrl;

  Poke({this.name, this.url, this.imageUrl});

  factory Poke.fromJson(Map<String, dynamic> json) {
    return Poke(
      name: json['name'],
      url: json['url'],
      imageUrl: json['imageUrl'] ?? '', // Define um valor padrão caso não haja URL de imagem
    );
  }

  
}