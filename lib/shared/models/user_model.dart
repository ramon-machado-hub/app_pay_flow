import 'dart:convert';

/*
Data model onde você consegue manipular dados entre
o sharedPreferences e objetos em dart.
 */
class UserModel{
  final String name;
  final String? photoURL;
  final String? email;

  UserModel({required this.name, this.photoURL, this.email});

  //transformar uma String para o Map
  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(name: map['name'], photoURL: map['photoURL'], email: map['email']);
  }

  //transformar para o json
  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));

  //transformar a classe atual em um Map
  Map <String,dynamic> toMap() => {
    "name": name,
    "photoUrl": photoURL,
    "email": email,
  };

  //converte um map para um objeto Json
  String toJson() => jsonEncode(toMap());
}