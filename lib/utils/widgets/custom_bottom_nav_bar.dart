import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../core/product/service/auth_service.dart';
import '../../core/theme/theme.dart';
import '../constants/router_constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({
    Key? key,
    required this.size,
    this.index = 0,
  }) : super(key: key);

  final Size size;
  final int index;

  AuthService auth = AuthService();

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
            duration: const Duration(milliseconds: 500),
            tabBackgroundColor: themeData.secondaryHeaderColor,
            color: Colors.black,
            selectedIndex: index,
            tabs: [
              GButton(
                onPressed: () {
                  Navigator.pushNamed(context, homeViewRoute);
                },
                icon: Icons.home_outlined,
                text: 'Ana Sayfa',
                textStyle: themeData.textTheme.headline4,
              ),
              GButton(
                onPressed: () {
                  Navigator.pushNamed(context, doctorViewRoute);
                },
                icon: Icons.person_outline,
                text: 'Doktorlar',
                textStyle: themeData.textTheme.headline4,
              ),
              // GButton(
              //     icon: Icons.notifications_outlined,
              //     textStyle: themeData.textTheme.headline4,
              //     text: 'Bildirimler'),
              GButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: themeData.secondaryHeaderColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16))),
                    builder: (context) {
                      return SizedBox(
                        height: size.height * 0.345,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(''),
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.close_outlined,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.025,
                            ),
                            ShowModelButtomSheetMenuItem(
                              size: size,
                              text: 'Randevularım',
                              icon: Icons.calendar_month_outlined,
                              onPressed: () {},
                            ),
                            _horizontalDivider(),
                            ShowModelButtomSheetMenuItem(
                              size: size,
                              text: 'Profile',
                              icon: Icons.person_outline_outlined,
                              onPressed: () {},
                            ),
                            _horizontalDivider(),
                            ShowModelButtomSheetMenuItem(
                              size: size,
                              text: 'Çıkış Yap',
                              icon: Icons.logout_outlined,
                              onPressed: (){
                                auth.signOut();
                                Navigator.pushNamed(context, signInViewRoute);
                              },
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
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

  Divider _horizontalDivider() {
    return Divider(
      color: Colors.white,
      thickness: 0.2,
      height: size.height * 0.035,
    );
  }
}

class ShowModelButtomSheetMenuItem extends StatelessWidget {
  const ShowModelButtomSheetMenuItem({
    Key? key,
    required this.size,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final Size size;
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size.width * 0.8,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: Icon(
                    icon,
                    color: themeData.secondaryHeaderColor,
                    size: 16,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Text(text),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
              size: 14,
            )
          ],
        ),
      ),
    );
  }
}
