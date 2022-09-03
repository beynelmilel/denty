import 'dart:typed_data';

import 'package:denty/core/theme/theme.dart';
import 'package:denty/utils/constants/assets_constants.dart';
import 'package:denty/utils/constants/colors_constants.dart';
import 'package:denty/utils/widgets/custom_button_widget.dart';
import 'package:denty/utils/widgets/custom_text_form_field.dart';
import 'package:denty/view/doctors/widget/appointment_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/pick_image.dart';

class AddDoctorsView extends StatefulWidget {
  const AddDoctorsView({Key? key}) : super(key: key);

  @override
  State<AddDoctorsView> createState() => _AddDoctorsViewState();
}

class _AddDoctorsViewState extends State<AddDoctorsView> {

  TextEditingController doctorAboutController = TextEditingController();
  TextEditingController nameSurnameController = TextEditingController();
  TextEditingController specialistController = TextEditingController();
  TextEditingController clinicNameController = TextEditingController();
  TextEditingController clinicAddressController = TextEditingController();

  Uint8List? _image;

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsConstans.customGrey,
      appBar: AppointmentAppBar(text: 'Doktor Ekle', appBar: AppBar()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                onTap: selectImage,
                child: Container(
                  alignment: Alignment.center,
                  height: size.height * 0.2,
                  // width: size.width * 0.6,
                  child: _image != null
                      ? Image(
                          image: MemoryImage(_image!),
                          height: size.height * 0.2,
                          fit: BoxFit.cover,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Lottie.asset(LottieConstants.doctorPhoto,
                                fit: BoxFit.cover),
                            Text(
                              'Upload \nPhoto',
                              style: TextStyle(
                                  color: themeData.primaryColor, fontSize: 15),
                            )
                          ],
                        ),
                )),
                CustomTextFormField(label: 'İsim Soyisim', controller: nameSurnameController),
                CustomTextFormField(label: 'Doktor Hakkında Bilgi', controller: doctorAboutController),
                CustomTextFormField(label: 'Uzmanlık Alanı', controller: specialistController),
                CustomTextFormField(label: 'Klinik Adı', controller: clinicNameController),
                CustomTextFormField(label: 'Klinik Adresi', controller: clinicAddressController),
                CustomButton(size: size, text: 'Doktoru Ekle', onPress: (){}, color: themeData.secondaryHeaderColor,)

          ],
        ),
      ),
    );
  }
}
