import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/model/user_model.dart';
import '../../../../core/theme/theme.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitial());

  FirebaseAuth auth = FirebaseAuth.instance;

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

abstract class AdminState {}

class AdminInitial extends AdminState {}