import 'package:denty/view/doctors/widget/appointment_app_bar.dart';
import 'package:flutter/material.dart';

class AddDoctorsView extends StatelessWidget {
  const AddDoctorsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppointmentAppBar(text: 'Doktor Ekle', appBar: AppBar()),
      
    );
  }
}
