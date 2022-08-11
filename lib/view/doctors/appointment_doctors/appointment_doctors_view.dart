import 'package:denty/utils/constants/colors_constants.dart';
import 'package:denty/view/doctors/view/doctors_view.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';
import '../../user/home/view/home_view.dart';

class DoctorsByAppointment extends StatelessWidget {
  const DoctorsByAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsConstans.customGrey,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text('Randevu Aldığınız Doktorlar',
            style: TextStyle(
                color: themeData.primaryColor, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: DoctorGridView(size: size),
      bottomNavigationBar: CustomBottomNavigationBar(size: size),
    );
  }
}
