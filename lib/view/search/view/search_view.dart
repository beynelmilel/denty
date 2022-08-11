library search_view;

import 'package:denty/core/theme/theme.dart';
import 'package:denty/utils/constants/colors_constants.dart';
import 'package:denty/utils/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

part 'search_container.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsConstans.customGrey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Detaylı Arama',
          style: themeData.textTheme.headline6,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: themeData.primaryColor,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.025,
          ),
          SearchContainer(
              size: size,
              onPress: () {},
              text: 'Select Area',
              icon: Icons.location_on_outlined),
          SizedBox(
            height: size.height * 0.0125,
          ),
          SearchContainer(
            size: size,
            onPress: () {},
            text: 'Specialist',
            icon: Icons.person_outline_outlined,
          ),
          SizedBox(
            height: size.height * 0.0125,
          ),
          SearchContainer(
            size: size,
            onPress: () async {
              final date = await pickDate();
            },
            text: 'Select Date',
            icon: Icons.calendar_today_outlined,
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          CustomButton(
            size: size,
            text: 'Search',
            onPress: () {},
            color: themeData.secondaryHeaderColor,
          ),
          Lottie.asset("assets/lottie/lottie_search_doctor.json",
              width: size.width, height: size.height * 0.4, fit: BoxFit.cover),
        ],
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030));
}
