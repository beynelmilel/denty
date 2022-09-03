import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String uid;
  final String nameSurname;
  final String age;
  final String phoneNumber;
  final String password;
  final String role;

  UserModel(
      {required this.role,
      required this.email,
      required this.uid,
      required this.nameSurname,
      required this.age,
      required this.phoneNumber,
      required this.password});

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      role: snapshot["role"],
      nameSurname: snapshot["nameSurname"],
      uid: snap.id,
      email: snapshot["email"],
      age: snapshot["age"],
      password: snapshot["password"],
      phoneNumber: snapshot["phoneNumber"],
    );
  }

  Map<String, dynamic> toJson() => {
        "nameSurname": nameSurname,
        "role": role,
        "uid": uid,
        "email": email,
        "age": age,
        "password": password,
        "phoneNumber": phoneNumber
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
      role: json['role'],
      email: json['email'],
      uid: json['uid'],
      nameSurname: json['nameSurname'],
      age: json['age'],
      phoneNumber: json['phoneNumber'],
      password: json['password']);
}
