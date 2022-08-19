import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';
import '../../../utils/constants/colors_constants.dart';
import '../../../utils/widgets/custom_bottom_nav_bar.dart';
import '../../user/widget/doctor_container.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsConstans.customGrey,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text('Doktorlar',
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
      
      body: DoctorGridView(
        size: size,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(size: size, index: 1)
    );
  }
}

class DoctorGridView extends StatelessWidget {
  const DoctorGridView({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.015,
        ),
        Expanded(
          child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.95),
              itemBuilder: ((context, index) {
                return DoctorContainer(size: size);
              })),
        ),
      ],
    );
  }
}
