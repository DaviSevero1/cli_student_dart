import 'dart:convert';


class City {
  int id;
  String nome;

  City({
    required this.id,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['id'],
      nome: map['nome'],
    );
  }

  factory City.fromJson(String json) => City.fromMap(jsonDecode(json));
}
