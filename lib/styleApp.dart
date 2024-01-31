import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static final ButtonStyle blueButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.blue),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    textStyle: MaterialStateProperty.all(
      const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
    ),
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 7,
      ),
    ),
  );// кнопка синяя с отступами внутри
}
abstract class StylesText {
  static const TextStyle sizeTextBlack = TextStyle(fontSize: 18.0, color: Colors.black);//стандартный для приложения стиль черный не крупный
  static const TextStyle sizeTextWhite = TextStyle(fontSize: 25.0, color: Colors.white);//белый для кнопок
}