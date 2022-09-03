import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/model/user_model.dart';
import '../../../../core/theme/theme.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<List<UserModel>> getUser() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList());

  Widget buildCard() => Container(
        color: Colors.red,
        width: 200,
        height: 200,
      );

  Widget buildSpace() => const SizedBox(
        width: 12,
      );

  Widget buildUser(UserModel user) {
    return Text('${user.nameSurname}',
        style: TextStyle(
            color: themeData.primaryColor, fontWeight: FontWeight.bold));
  }

  Future<UserModel?> readUser(BuildContext context) async {
    final docUser = FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid.toString());
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return UserModel.fromJson(snapshot.data()!);
    }
    return null;
  }
}

abstract class HomeState {}

class HomeInitial extends HomeState {}
