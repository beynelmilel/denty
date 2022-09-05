import 'package:denty/core/theme/theme.dart';
import 'package:denty/utils/constants/colors_constants.dart';
import 'package:denty/utils/widgets/custom_button_widget.dart';
import 'package:denty/view/admin/profile/viewmodel/admin_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/model/user_model.dart';

class AdminProfileView extends StatelessWidget {
  const AdminProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AdminProfileCubit(),
      child: BlocConsumer<AdminProfileCubit, AdminProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _buildScaffold(size, context);
        },
      ),
    );
  }

  Scaffold _buildScaffold(Size size, BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstans.customGrey,
      appBar: AppBar(
        toolbarHeight: size.height * 0.12,
        backgroundColor: themeData.secondaryHeaderColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
          onPressed: () {
            Navigator.canPop(context);
          },
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
            _profileContainer(size, context, Padding(
                    padding: EdgeInsets.only(left: size.width * 0.05),
                    child: FutureBuilder<UserModel?>(
                      future:
                          context.read<AdminProfileCubit>().readUser(context),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('olmadı geri dön :D');
                        }
                        if (snapshot.hasData) {
                          final user = snapshot.data;
                          return user == null
                              ? Center(
                                  child: Text('dfasdfasfda'),
                                )
                              : context
                                  .read<AdminProfileCubit>()
                                  .getUserName(user);
                        }
                        return Text('iptal');
                      },
                    )),'İsim Soyisim'), 
            _profileContainer(size, context, Padding(
                    padding: EdgeInsets.only(left: size.width * 0.05),
                    child: FutureBuilder<UserModel?>(
                      future:
                          context.read<AdminProfileCubit>().readUser(context),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('olmadı geri dön :D');
                        }
                        if (snapshot.hasData) {
                          final user = snapshot.data;
                          return user == null
                              ? Center(
                                  child: Text('dfasdfasfda'),
                                )
                              : context
                                  .read<AdminProfileCubit>()
                                  .getUserEmail(user);
                        }
                        return Text('iptal');
                      },
                    )),'Email'),
            _profileContainer(size, context, Padding(
                    padding: EdgeInsets.only(left: size.width * 0.05),
                    child: FutureBuilder<UserModel?>(
                      future:
                          context.read<AdminProfileCubit>().readUser(context),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('olmadı geri dön :D');
                        }
                        if (snapshot.hasData) {
                          final user = snapshot.data;
                          return user == null
                              ? Center(
                                  child: Text('dfasdfasfda'),
                                )
                              : context
                                  .read<AdminProfileCubit>()
                                  .getUserAge(user);
                        }
                        return Text('iptal');
                      },
                    )), 'Yaş'),
            _profileContainer(size, context, Padding(
                    padding: EdgeInsets.only(left: size.width * 0.05),
                    child: FutureBuilder<UserModel?>(
                      future:
                          context.read<AdminProfileCubit>().readUser(context),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('olmadı geri dön :D');
                        }
                        if (snapshot.hasData) {
                          final user = snapshot.data;
                          return user == null
                              ? Center(
                                  child: Text('dfasdfasfda'),
                                )
                              : context
                                  .read<AdminProfileCubit>()
                                  .getUserPhoneNumber(user);
                        }
                        return Text('iptal');
                      },
                    )), 'Telefon Numarası'), 
            SizedBox(
              height: size.height * 0.1,
            ),
            CustomButton(
              size: size,
              text: 'Çıkış Yap',
              onPress: () {
                context.read<AdminProfileCubit>().signOut(context);
              },
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }

  Column _profileContainer(Size size, BuildContext context, Widget child, String label) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.035,
              ),
              Text(
                label,
                style: TextStyle(
                    color: Colors.blueGrey, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                width: size.width,
                alignment: Alignment.centerLeft,
                height: size.height * 0.08,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: child
              )
            ],
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
