import 'dart:convert';

class Telefone {
  int ddd;
  String telefone;

  Telefone({
    required this.ddd,
    required this.telefone,
  });

  //toMap -> que pega o nosso objeto Telefone e transforma em um Objeto Map<String, DYNAMIC>

  Map<String, dynamic> toMap() {
    return {
      'ddd': ddd,
      'telefone': telefone,
    };
  }

  // toJson -> Metodo que pega um Mpas<String>, dynamic e transforma em um json pelo pacote dart:convert(JsonEncode)
  String toJson() => jsonEncode(toMap());

  //passo 2 da deserialização
  factory Telefone.fromMap(Map<String, dynamic> map) {
    return Telefone(
      ddd: map['ddd'] ?? 0,
      telefone: map['telefone'] ?? '',
    );
  }

  //Passo 1

  factory Telefone.fromJson(String json) => Telefone.fromMap(jsonDecode(json));
}