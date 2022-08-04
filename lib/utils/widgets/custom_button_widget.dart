import 'package:flutter/material.dart';

import '../../core/theme/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.size,
    required this.text,
    this.color = Colors.white,
    this.borderColor = Colors.transparent, required this.onPress,
  }) : super(key: key);

  final Size size;
  final String text;
  final Color color, borderColor;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.07,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(6))),
        child: Text(
          text,
          style: themeData.textTheme.headline2,
        ),
      ),
    );
  }
}
