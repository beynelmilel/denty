import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:denty/utils/constants/router_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/model/user_model.dart';
import '../../../../core/theme/theme.dart';

class AdminProfileCubit extends Cubit<AdminProfileState> {
  AdminProfileCubit() : super(AdminProfileInitial());

  FirebaseAuth auth = FirebaseAuth.instance;

  Widget getUserName(UserModel user) {
    return Text(user.nameSurname,
        style: TextStyle(
            color: themeData.primaryColor, fontWeight: FontWeight.w600));
  }

  Widget getUserPhoneNumber(UserModel user) {
    return Text(user.phoneNumber,
        style: TextStyle(
            color: themeData.primaryColor, fontWeight: FontWeight.w600));
  }

  Widget getUserEmail(UserModel user) {
    return Text(user.email,
        style: TextStyle(
            color: themeData.primaryColor, fontWeight: FontWeight.w600));
  }

  Widget getUserAge(UserModel user) {
    return Text(user.age,
        style: TextStyle(
            color: themeData.primaryColor, fontWeight: FontWeight.w600));
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

  Future<void> signOut(BuildContext context) async {
    await auth.signOut();
    // ignore: use_build_context_synchronously
    Navigator.pushNamedAndRemoveUntil(context, signInViewRoute, (route) => false);
  }
}

abstract class AdminProfileState {}

class AdminProfileInitial extends AdminProfileState {}
