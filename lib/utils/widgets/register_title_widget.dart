import 'package:denty/core/theme/theme.dart';
import 'package:flutter/material.dart';

class RegisterTitle extends StatelessWidget {
  const RegisterTitle({
    Key? key,
    required this.title,
    required this.questionText, required this.onPressed, required this.textButtonText,
  }) : super(key: key);

  final String title,textButtonText,questionText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: themeData.textTheme.headline3,
        ),
        Row(
          children: [
            Text(
              questionText,
              style: TextStyle(color: themeData.primaryColor),
            ),
            TextButton(onPressed: onPressed, child: Text(textButtonText)),
          ],
        ),
      ],
    );
  }
}
