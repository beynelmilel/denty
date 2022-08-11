import 'package:denty/utils/constants/assets_constants.dart';
import 'package:denty/utils/widgets/background_container_widget.dart';
import 'package:denty/utils/widgets/custom_text_form_field.dart';
import 'package:denty/view/doctors/widget/appointment_app_bar.dart';
import 'package:flutter/material.dart';

class AppointmentView extends StatefulWidget {
  const AppointmentView({Key? key}) : super(key: key);

  @override
  State<AppointmentView> createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView> {
  final TextEditingController _tcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppointmentAppBar(
          text: 'Randevu Al',
          appBar: AppBar(),
        ),
        body: SingleChildScrollView(
          child: BackgroundContainer(
            backgroundImage: BackgroundConstants.whiteBackground,
            size: size,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
              ),
              child: Column(
                children: [
                  Form(
                    child: (CustomTextFormField(
                      label: 'TC Kimlik No',
                      controller: _tcController,
                      keyboardType: TextInputType.number,
                    )),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
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
                              'Select Day',
                              style: TextStyle(color: Colors.black),
                            ),
                            Icon(Icons.calendar_month_outlined)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
