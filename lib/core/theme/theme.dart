import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  iconTheme: IconThemeData(
    color: Colors.black,
  ),
  primaryColor: Colors.black,
  secondaryHeaderColor: const Color.fromRGBO(38, 94, 215, 1),
  
).copyWith(
  primaryColor: Colors.black,
  textTheme: const TextTheme(
      headline1: TextStyle(
          color: Colors.white, fontSize: 65, fontWeight: FontWeight.bold),
      headline2: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      headline3: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
      headline4: TextStyle(fontWeight: FontWeight.w400)       ,
      headline5: TextStyle(fontSize: 8,color: Colors.black, fontWeight: FontWeight.bold) ,
      headline6: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
              
              ),
    
);
