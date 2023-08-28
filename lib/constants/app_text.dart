import 'package:flutter/material.dart';
import 'colors.dart';
import 'dimentions.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  Color? color;
  final double size;
  final TextAlign? align;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final double? height;
  final String? fontFamily;

  AppText({
    super.key,
    required this.text,
    this.size = 14,
    this.color,
    this.fontWeight = FontWeight.w100,
    this.align,
    this.decoration,
    this.overflow,
    this.maxLines,
    this.height,
    this.fontFamily,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.start,
      textScaleFactor: 1,
      style: TextStyle(
        color: color ?? AppColors.blackColor,
        fontSize: size.toInt().font,
        height: height != null ? height! / size : null,
        decoration: decoration ?? TextDecoration.none,
        decorationStyle: TextDecorationStyle.solid,
        fontWeight: fontWeight,
        fontFamily: fontFamily ?? "lotta",
      ),
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}
