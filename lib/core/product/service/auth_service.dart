import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:denty/core/model/user_model.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserModel> getUserDetails() async {
    final User? user = auth.currentUser;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(user?.uid).get();

    return UserModel.fromSnap(documentSnapshot);
  }


  Future<String> signUpUser({
    required String email,
    required String password,
    required String nameSurname,
    required String age,
    required String phoneNumber,
    required String role,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          nameSurname.isNotEmpty ||
          age.isNotEmpty ||
          phoneNumber.isNotEmpty ||
          role.isNotEmpty) {

        UserCredential cred = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        UserModel user = UserModel(
            nameSurname: nameSurname,
            uid: cred.user!.uid,
            email: email,
            password: password,
            age: age,
            phoneNumber: phoneNumber,
            role: role);

        // adding user in our database
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(user.toJson());

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }



  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
