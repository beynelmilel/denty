import 'package:denty/core/theme/theme.dart';
import 'package:denty/utils/constants/assets_constants.dart';
import 'package:denty/utils/widgets/background_container_widget.dart';
import 'package:denty/utils/widgets/custom_button_widget.dart';
import 'package:denty/utils/widgets/custom_text_form_field.dart';
import 'package:denty/view/doctors/widget/appointment_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppointmentView extends StatefulWidget {
  const AppointmentView({Key? key}) : super(key: key);

  @override
  State<AppointmentView> createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView> {
  final TextEditingController identityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppointmentAppBar(
          text: 'Randevu Al',
          appBar: AppBar(),
        ),
        body: BackgroundContainer(
          backgroundImage: BackgroundConstants.whiteBackground,
          size: size,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Form(
                  child: (CustomTextFormField(
                    label: 'TC Kimlik No',
                    controller: identityController,
                    keyboardType: TextInputType.number,
                  )),
                ),
                GestureDetector(child: _selectContainer(size, 'Select Day', Icons.calendar_month_outlined,)),
                GestureDetector(child: _selectContainer(size, 'Select Clock', Icons.schedule_outlined)),
                _selectContainer(size, 'Dr Muhammed Melih Gündoğan', Icons.person_outline_outlined),
                CustomButton(size: size, text: 'Randevu Oluştur', onPress: (){}, color: themeData.secondaryHeaderColor,),
                Lottie.asset(LottieConstants.appointment),
              ],
            ),
          ),
        ));
  }

  Container _selectContainer(Size size, String text, IconData icon) {
    return Container(
      height: size.height * 0.082,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.black),
            ),
            Icon(icon)
          ],
        ),
      ),
    );
  }
}
