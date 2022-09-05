import 'package:cloud_firestore/cloud_firestore.dart';

class AddDoctorModel {
  String? id;
  String? nameSurname;
  String? specialist;
  String? clinicName;
  String? clinicAddress;
  String? doctorAbout;
  String? phoneNumber;
  String? image;

  AddDoctorModel(
      {this.id,
      this.nameSurname,
      this.specialist,
      this.clinicName,
      this.clinicAddress,
      this.doctorAbout,
      this.phoneNumber,
      this.image});

  AddDoctorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameSurname = json['nameSurname'];
    specialist = json['specialist'];
    clinicName = json['clinicName'];
    clinicAddress = json['clinicAddress'];
    doctorAbout = json['doctorAbout'];
    phoneNumber = json['phoneNumber'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nameSurname'] = nameSurname;
    data['specialist'] = specialist;
    data['clinicName'] = clinicName;
    data['clinicAddress'] = clinicAddress;
    data['doctorAbout'] = doctorAbout;
    data['phoneNumber'] = phoneNumber;
    data['image'] = image;
    return data;
  }
  
  factory AddDoctorModel.fromSnapshot(DocumentSnapshot snapshot) {
    return AddDoctorModel(
      id: snapshot.id,
      nameSurname: snapshot['nameSurname'],
      specialist: snapshot['specialist'],
      clinicName: snapshot['clinicName'],
      clinicAddress: snapshot['clinicAddress'],
      doctorAbout: snapshot['doctorAbout'],
      phoneNumber: snapshot['phoneNumber'],
      image: snapshot['image'],
    );
  }
}
