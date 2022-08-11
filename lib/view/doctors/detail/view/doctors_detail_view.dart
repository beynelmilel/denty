import 'package:denty/utils/constants/assets_constants.dart';
import 'package:denty/utils/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../../utils/constants/colors_constants.dart';
import '../../widget/appointment_app_bar.dart';

class DoctorDetailView extends StatelessWidget {
  const DoctorDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsConstans.customGrey,
      appBar: AppointmentAppBar(text: 'Dr. Muhammed Melih Gündoğan', appBar: AppBar(),),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ContactButton(
                size: size,
                text: 'Voice Call',
                icon: Icons.call_outlined,
                color: Colors.blueAccent,
                onPress: () {},
              ),
              ContactButton(
                size: size,
                text: 'Video Call',
                icon: Icons.video_call_outlined,
                color: Colors.purpleAccent,
                onPress: () {},
              ),
              ContactButton(
                size: size,
                text: 'Message',
                icon: Icons.message_outlined,
                color: Colors.orangeAccent,
                onPress: () {},
              )
            ],
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
            height: size.height * 0.03,
          ),
          CustomButton(
            size: size,
            text: 'Randevu Talebi Oluştur',
            onPress: () {},
            color: themeData.secondaryHeaderColor,
          )
        ],
      ),
    );
  }
}



class DataText extends StatelessWidget {
  const DataText({
    Key? key,
    required this.text,
    required this.detail,
  }) : super(key: key);

  final String text, detail;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          text,
          style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 10,
              fontWeight: FontWeight.w700),
        ),
        Text(detail,
            style: TextStyle(
                color: themeData.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w400))
      ],
    );
  }
}

class ContactButton extends StatelessWidget {
  const ContactButton({
    Key? key,
    required this.size,
    required this.text,
    required this.icon,
    required this.color,
    required this.onPress,
  }) : super(key: key);

  final Size size;
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: size.height * 0.05,
        width: size.width * 0.27,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 15,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
