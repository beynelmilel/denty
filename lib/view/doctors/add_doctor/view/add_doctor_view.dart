import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/theme/theme.dart';
import '../../../../utils/constants/assets_constants.dart';
import '../../../../utils/constants/colors_constants.dart';
import '../../../../utils/widgets/custom_button_widget.dart';
import '../../../../utils/widgets/custom_text_form_field.dart';
import '../../widget/appointment_app_bar.dart';
import '../viewmodel/add_doctor_cubit.dart';

class AddDoctorsView extends StatelessWidget {
  const AddDoctorsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AddDoctorCubit(),
      child: BlocConsumer<AddDoctorCubit, AddDoctorState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return _buildScaffold(size, context);
        },
      )
    );
  }

  Scaffold _buildScaffold(Size size, BuildContext context) {
    return Scaffold(
    backgroundColor: ColorsConstans.customGrey,
    appBar: AppointmentAppBar(text: 'Doktor Ekle', appBar: AppBar()),
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: context.read<AddDoctorCubit>().selectImage,
                    child: Container(
                      alignment: Alignment.center,
                      height: size.height * 0.2,
                      // width: size.width * 0.6,
                      child: context.read<AddDoctorCubit>().image != null
                          ? Image(
                              image: MemoryImage(context.read<AddDoctorCubit>().image!),
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
                    CustomTextFormField(label: 'İsim Soyisim', controller: context.read<AddDoctorCubit>().nameSurnameController),
                    CustomTextFormField(label: 'Doktor Hakkında Bilgi', controller: context.read<AddDoctorCubit>().doctorAboutController),
                    CustomTextFormField(label: 'Uzmanlık Alanı', controller: context.read<AddDoctorCubit>().specialistController),
                    CustomTextFormField(label: 'Klinik Adı', controller: context.read<AddDoctorCubit>().clinicNameController),
                    CustomTextFormField(label: 'Klinik Adresi', controller: context.read<AddDoctorCubit>().clinicAddressController),
                    CustomButton(size: size, text: 'Doktoru Ekle', onPress: (){
                      context.read<AddDoctorCubit>().addDoctor();
                    }, color: themeData.secondaryHeaderColor,)
              ],
            ),
          ),
        ],
      ),
    ),
  );
  }
}
