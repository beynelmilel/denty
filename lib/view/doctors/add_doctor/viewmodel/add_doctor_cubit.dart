import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:denty/view/doctors/add_doctor/service/add_doctor_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/pick_image.dart';
import '../model/add_doctor_model.dart';

class AddDoctorCubit extends Cubit<AddDoctorState> {
  AddDoctorCubit() : super(AddDoctorInitial());

  TextEditingController doctorAboutController = TextEditingController();
  TextEditingController nameSurnameController = TextEditingController();
  TextEditingController specialistController = TextEditingController();
  TextEditingController clinicNameController = TextEditingController();
  TextEditingController clinicAddressController = TextEditingController();
  bool _isLoading = false;
  Uint8List? image;

  void selectImage() async {
    Uint8List newImage = await pickImage(ImageSource.gallery);
    image = newImage;
  }

  Future<void> addDoctor() async {
    _isLoading = true;
    String response = await AddDoctorService().fetchAddDoctor(
        nameSurname: nameSurnameController.text,
        specialist: specialistController.text,
        clinicName: clinicNameController.text,
        clinicAddress: clinicAddressController.text,
        doctorAbout: doctorAboutController.text,
        image: image.toString());
    if (response == "success") {
    //   _isLoading = false;
    //   emit(AddDoctorSuccess());
    // } else {
    //   _isLoading = false;
    //   emit(AddDoctorFailed());
    }
  }
}

abstract class AddDoctorState {}

class AddDoctorInitial extends AddDoctorState {}
