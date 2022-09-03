import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/model/user_model.dart';
import '../../../../core/theme/theme.dart';
import '../../../../utils/constants/colors_constants.dart';
import '../../../../utils/widgets/custom_bottom_nav_bar.dart';
import '../../widget/doctor_container.dart';
import '../viewmodel/home_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _buildScaffold(size);
        },
      ),
    );
  }

  Scaffold _buildScaffold(Size size) {
    return Scaffold(
      backgroundColor: ColorsConstans.customGrey,
      appBar: AppBar(
          centerTitle: false,
          toolbarHeight: size.height * 0.1,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hoşgeldin',
                style: TextStyle(
                    color: themeData.primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              FutureBuilder<UserModel?>(
                future: context.read<HomeCubit>().readUser(context),
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
                        : context.read<HomeCubit>().buildUser(user);
                  }
                  return Text('iptal');
                },
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search_outlined,
                  color: themeData.primaryColor,
                ))
          ]),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Avaliable Doctor',
                  style: TextStyle(color: themeData.primaryColor),
                ),
                TextButton(onPressed: () {}, child: const Text('Tümünü Gör')),
              ],
            ),
            SizedBox(
              height: size.height * 0.25,
              child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      context.read<HomeCubit>().buildSpace(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    return DoctorContainer(size: size);
                  })),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Son Randevular',
                  style: TextStyle(color: themeData.primaryColor),
                ),
                TextButton(onPressed: () {}, child: const Text('Tümünü Gör')),
              ],
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                'Randevularınızın görünmesi için öncelikle bir hekimden randevu almanız gerekmektedir.',
                style: themeData.textTheme.headline6,
              ),
              height: size.height * 0.2,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(size: size),
    );
  }
}


// Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       'Kategoriler',
            //       style: TextStyle(color: themeData.primaryColor),
            //     ),
            //     TextButton(onPressed: () {}, child: const Text('Tümünü Gör')),
            //   ],
            // ),
            // SizedBox(
            //   height: size.height * 0.09,
            //   child: ListView.separated(
            //       separatorBuilder: (context, index) => buildSpace(),
            //       scrollDirection: Axis.horizontal,
            //       itemCount: 20,
            //       itemBuilder: ((context, index) {
            //         return Container(
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               Image.asset('assets/icon/png/ic_braces.png'),
            //               Text(
            //                 'Ortodonti',
            //                 style: themeData.textTheme.headline5,
            //               )
            //             ],
            //           ),
            //           width: size.width * 0.18,
            //           decoration: BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.circular(8)),
            //         );
            //       })),
            // ),