import 'package:denty/core/theme/theme.dart';
import 'package:denty/utils/constants/colors_constants.dart';
import 'package:flutter/material.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsConstans.customGrey,
      appBar: AppBar(
        toolbarHeight: size.height * 0.12,
        backgroundColor: themeData.secondaryHeaderColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text('Profil'),
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(right: size.width * 0.03),
              child: Row(
                children: [
                  Icon(
                    Icons.edit_outlined,
                    size: 20,
                  ),
                  Text('Edit')
                ],
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileAboutContainer(
              size: size,
              label: 'İsim Soyisim',
              text: 'Muhammed Melih Gündoğan',
            ),
            ProfileAboutContainer(
              size: size,
              label: 'Email',
              text: 'melihgundogan@denty.com',
            ),
            ProfileAboutContainer(
              size: size,
              label: 'Yaş',
              text: '22',
            ),
            ProfileAboutContainer(
              size: size,
              label: 'Telefon Numarası',
              text: '05921584596',
            ),
            
          ],
        ),
      ),
    );
  }
}

class ProfileAboutContainer extends StatelessWidget {
  const ProfileAboutContainer({
    Key? key,
    required this.size,
    required this.label,
    required this.text,
  }) : super(key: key);

  final Size size;
  final String label, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.035,
        ),
        Text(
          label,
          style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Container(
          width: size.width,
          alignment: Alignment.centerLeft,
          height: size.height * 0.08,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: Text(
              text,
              style: TextStyle(
                  color: themeData.primaryColor, fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }
}
