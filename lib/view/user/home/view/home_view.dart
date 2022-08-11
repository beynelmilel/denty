import 'package:denty/utils/constants/assets_constants.dart';
import 'package:denty/utils/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../core/theme/theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              Text('Muhammed Melih Gündoğan',
                  style: TextStyle(
                      color: themeData.primaryColor,
                      fontWeight: FontWeight.bold))
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
                  'Kategoriler',
                  style: TextStyle(color: themeData.primaryColor),
                ),
                TextButton(onPressed: () {}, child: const Text('Tümünü Gör')),
              ],
            ),
            SizedBox(
              height: size.height * 0.09,
              child: ListView.separated(
                  separatorBuilder: (context, index) => buildSpace(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/icon/png/ic_braces.png'),
                          Text(
                            'Ortodonti',
                            style: themeData.textTheme.headline5,
                          )
                        ],
                      ),
                      width: size.width * 0.18,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                    );
                  })),
            ),
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
                  separatorBuilder: (context, index) => buildSpace(),
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
              child: Text('Randevularınızın görünmesi için öncelikle bir hekimden randevu almanız gerekmektedir.', style: themeData.textTheme.headline6,),
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

  Widget buildCard() => Container(
        color: Colors.red,
        width: 200,
        height: 200,
      );

  Widget buildSpace() => const SizedBox(
        width: 12,
      );
}

class DoctorContainer extends StatelessWidget {
  const DoctorContainer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8)),
      child: GestureDetector(
        onTap: (){},
        child: Container(
          width: size.width * 0.42,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Image.asset(
                    ImageConstants.doctor,
                    height: size.height * 0.15,
                    width: size.width,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.015),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. Muhammed Melih Gündoğandasdsacasd',
                          style: TextStyle(
                              color: Colors.black, fontSize: 14),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text('Alanı: Ortodonti',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10)),
                        SizedBox(
                          height: size.height * 0.003,
                        ),
                        Text('Tecrübesi: 9 Yıl',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, vertical: size.height * 0.02),
          child: GNav(
            gap: 8,
            activeColor: Colors.white,
            iconSize: 20,
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: size.width * 0.025),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: themeData.secondaryHeaderColor,
            color: Colors.black,
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: 'Ana Sayfa',
                textStyle: themeData.textTheme.headline4,
              ),
              GButton(
                icon: Icons.person_outline,
                text: 'Doktorlar',
                textStyle: themeData.textTheme.headline4,
              ),
              GButton(
                  icon: Icons.notifications_outlined,
                  textStyle: themeData.textTheme.headline4,
                  text: 'Bildirimler'),
              GButton(
                icon: Icons.menu_outlined,
                text: 'Menü',
                textStyle: themeData.textTheme.headline4,
              )
            ],
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
