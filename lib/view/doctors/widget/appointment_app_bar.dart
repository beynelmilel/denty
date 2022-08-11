import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';

class AppointmentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppointmentAppBar({
    Key? key,
    required this.text, required this.appBar,
  }) : super(key: key);

  final String text;
  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: themeData.primaryColor,
          )),
      centerTitle: true,
      title: Text(
        text,
        style: TextStyle(
            color: themeData.primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 16),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
