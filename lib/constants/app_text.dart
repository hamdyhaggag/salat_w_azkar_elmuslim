import 'package:flutter/material.dart';
import 'colors.dart';
import 'dimentions.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  Color? color;
  final double fontSize;
  final TextAlign? align;
  final TextDirection? textDirection;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final double? height;
  final String? fontFamily;

  AppText(
    this.text, {
    super.key,
    this.fontSize = 14,
    this.color,
    this.fontWeight = FontWeight.w100,
    this.align,
    this.textDirection,
    this.decoration,
    this.overflow,
    this.maxLines,
    this.height,
    this.fontFamily,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Text(
      text,
      textAlign: align ?? TextAlign.start,
      textDirection: textDirection ?? TextDirection.rtl,
      textScaleFactor: 1,
      style: TextStyle(
        color: color ?? (isDarkMode ? Colors.white : AppColors.primaryColor),
        fontSize: fontSize.toInt().font,
        height: height != null ? height! / fontSize : null,
        decoration: decoration ?? TextDecoration.none,
        decorationStyle: TextDecorationStyle.solid,
        fontWeight: fontWeight,
        fontFamily: fontFamily ?? "Cairo",
      ),
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}
