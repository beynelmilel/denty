import 'package:denty/utils/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/theme.dart';
import '../../../../../utils/constants/assets_constants.dart';
import '../../../../../utils/constants/colors_constants.dart';
import '../../../../doctors/detail/view/doctors_detail_view.dart';
import '../../../../doctors/widget/appointment_app_bar.dart';

class MyDoctorsDetailView extends StatelessWidget {
  const MyDoctorsDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsConstans.customGrey,
      appBar: AppointmentAppBar(
        text: 'Dr. Muhammed Melih Gündoğan',
        appBar: AppBar(),
      ),
      body: Column(
        children: [
          Image.asset(
            ImageConstants.doctor,
            height: size.height * 0.4,
            fit: BoxFit.cover,
            width: size.width,
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Medicine & Heart Spelist',
                  style: TextStyle(
                      fontSize: 16,
                      color: themeData.primaryColor,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  'İyi Sağlık Kliniği, İstanbul / Kadıköy',
                  style: TextStyle(
                      color: themeData.primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  'Doktor Hakkında',
                  style: TextStyle(
                      color: themeData.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Text(
                    style: TextStyle(
                        color: themeData.primaryColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w400),
                    'ojbnfudbsuıneuonbdfnbuoıneuıobnoefnbdfnboenbouenbfdsnbjldfknsjkbvneıovnboevbnoebneobneoubnosvbnoasdfvnjjjjjjjjjjjjjjjjjjjjjjjjjjjjaojbnfudbsuıneuonbdfnbuoıneuıobnoefnbdfnboenbouenbfdsnbjldfknsjkbvneıovnoebneobneoubnosvbnoasdfvnjjjjjjjjjjjjjjjjjjjjjjjjjjjja'),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DataText(
                      text: 'Bakılan Hasta Sayısı',
                      detail: '1500',
                    ),
                    DataText(
                      text: 'Tecrübe',
                      detail: '8 Yıl',
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          CustomButton(
            size: size,
            text: 'Doktor Profilini Düzenle',
            onPress: () {},
            color: Colors.green,
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          CustomButton(
            size: size,
            text: 'Doktor Profilini Sil',
            onPress: () {},
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
