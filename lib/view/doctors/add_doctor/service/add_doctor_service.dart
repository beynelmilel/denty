import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:denty/view/doctors/add_doctor/model/add_doctor_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddDoctorService{
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addDoctor(AddDoctorModel addDoctorModel) async{
    final docUser = _firestore.collection('doctors').doc(auth.currentUser!.uid.toString());
    docUser.set(addDoctorModel.toJson());
  }

  Future<String> fetchAddDoctor({
    required String nameSurname,
    required String specialist,
    required String clinicName,
    required String clinicAddress,
    required String doctorAbout,
    required String image,
  }) async{
    String res = "Some error Occurred";
    try {
      if (nameSurname.isNotEmpty ||
          specialist.isNotEmpty ||
          clinicName.isNotEmpty ||
          clinicAddress.isNotEmpty ||
          doctorAbout.isNotEmpty ||
          image.isNotEmpty) {

        FirebaseAuth auth = FirebaseAuth.instance;

        AddDoctorModel addDoctorModel = AddDoctorModel(
            nameSurname: nameSurname,
            id: auth.currentUser!.uid,
            specialist: specialist,
            clinicName: clinicName,
            clinicAddress: clinicAddress,
            doctorAbout: doctorAbout,
            image: image);

        // adding user in our database
        await _firestore
            .collection("doctors")
            .doc(auth.currentUser!.uid)
            .set(addDoctorModel.toJson());

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

}