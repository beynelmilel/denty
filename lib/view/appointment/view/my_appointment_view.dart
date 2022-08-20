import 'package:denty/core/theme/theme.dart';
import 'package:denty/utils/constants/colors_constants.dart';
import 'package:denty/view/doctors/widget/appointment_app_bar.dart';
import 'package:flutter/material.dart';

class MyAppointmentView extends StatelessWidget {
  const MyAppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ColorsConstans.customGrey,
        appBar: AppointmentAppBar(text: 'Randevularım', appBar: AppBar()),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
          cacheExtent: 0,
          itemCount: 200,
          itemBuilder: (context, index) {
            return AnimatedScrollViewItem(
              child: ListItem(),
            );
          },
        ));
  }
}

class AnimatedScrollViewItem extends StatefulWidget {
  const AnimatedScrollViewItem({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<AnimatedScrollViewItem> createState() => _AnimatedScrollViewItemState();
}

class _AnimatedScrollViewItemState extends State<AnimatedScrollViewItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..forward();

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: widget.child,
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    this.title = '',
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.only(bottom: 15,),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: size.width * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _appointmentColumn('Date', '03/08/2022'),
                _appointmentColumn('Time', '13.00/14.00'),
                _appointmentColumn('Yer', 'Gündoğan Klinik'),
              ],
            ),
            Divider(
              color: Colors.black,
              height: size.height * 0.06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _appointmentColumn('Doktor', 'Muhammed Melih Gündoğan'),
                Container(
                  alignment: Alignment.center,
                  width: size.width * 0.225,
                  height: size.height * 0.045,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text('İptal Et'),
                )
              ],
            )
          ],
        ));
  }

  Column _appointmentColumn(String title, String subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.black26),
        ),
        Text(
          subTitle,
          style: TextStyle(
              color: themeData.primaryColor, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
