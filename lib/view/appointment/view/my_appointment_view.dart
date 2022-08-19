import 'package:denty/view/doctors/widget/appointment_app_bar.dart';
import 'package:flutter/material.dart';

class MyAppointmentView extends StatelessWidget {
  const MyAppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            color: Colors.blue,
          );
        },
      ),
    );
  }
}
