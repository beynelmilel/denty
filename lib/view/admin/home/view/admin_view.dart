import 'package:denty/utils/constants/assets_constants.dart';
import 'package:denty/utils/constants/colors_constants.dart';
import 'package:denty/utils/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

class AdminView extends StatelessWidget {
  const AdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsConstans.customGrey,
      appBar: AppBar(
          centerTitle: false,
          toolbarHeight: size.height * 0.1,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hoşgeldin',
                style: TextStyle(
                    color: themeData.primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              Text('Muhammed Melih Gündoğan',
                  style: TextStyle(
                      color: themeData.primaryColor,
                      fontWeight: FontWeight.bold))
            ],
          ),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: size.width * 0.025),
                child: CircleAvatar(
                  backgroundColor: themeData.secondaryHeaderColor,
                  radius: 25,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.white,
                      )),
                )),
          ]),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomButton(
                size: size,
                color: themeData.secondaryHeaderColor,
                text: 'Kliniğinizdeki Doktorun Profilini Oluşturun',
                onPress: () {}),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Doktorlarınız',
                style: TextStyle(color: themeData.primaryColor),
              ),
              TextButton(onPressed: () {}, child: const Text('Tümünü Gör'))
            ]),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: size.height * 0.115,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.0175),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          ImageConstants.doctor,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Dr. Muhammed Melih Gündoğan',
                          style: TextStyle(
                              color: themeData.primaryColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        ),
                        Text('Specialists',
                            style: TextStyle(
                                color: themeData.primaryColor, fontSize: 8)),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 12,
                            ),
                            Text('Clinic Name',
                                style: TextStyle(
                                    color: themeData.primaryColor,
                                    fontSize: 8)),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Doktorlarınızın Randevuları',
                style: TextStyle(color: themeData.primaryColor),
              ),
              TextButton(onPressed: () {}, child: const Text('Tümünü Gör'))
            ]),
            Container(
              height: size.height * 0.115,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Muhammed Melih Gündoğan',
                        style: TextStyle(
                            color: themeData.primaryColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                      Text('Randevu Saati: 12.00 - 14.00',
                          style: TextStyle(
                              color: themeData.primaryColor, fontSize: 8)),
                      Text('Yaş: 22',
                          style: TextStyle(
                              color: themeData.primaryColor, fontSize: 8)),
                    ],
                  ),
                  VerticalDivider(
                    color: themeData.primaryColor,
                    width: size.width * 0.001,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Dr. Muhammed Melih Gündoğan',
                        style: TextStyle(
                            color: themeData.primaryColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                      Text('Specialists',
                          style: TextStyle(
                              color: themeData.primaryColor, fontSize: 8)),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 12,
                          ),
                          Text('Clinic Name',
                              style: TextStyle(
                                  color: themeData.primaryColor, fontSize: 8)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            //   Text(
            //     'Doktorlarınızın Randevuları',
            //     style: TextStyle(color: themeData.primaryColor),
            //   ),
            //   TextButton(onPressed: () {}, child: const Text('Tümünü Gör'))
            // ]),
            // SizedBox(
            //   height: size.height * 0.25,
            //   child: ListView.separated(
            //         separatorBuilder: (context, index) => SizedBox(width: 5,),
            //         scrollDirection: Axis.horizontal,
            //         itemCount: 20,
            //         itemBuilder: ((context, index) {
            //           return DoctorContainer(size: size);
            //         })),
            // ),
          ],
        ),
      ),
    );
  }
}
