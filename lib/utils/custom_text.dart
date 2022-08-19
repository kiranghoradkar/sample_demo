import 'package:flutter/material.dart';
import 'package:sample_demo/utils/ui_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double textSize;
  final Color textColor;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final int maxline;
  final TextDecoration underline;

 const CustomText(
      {Key? key,
      this.text = '',
      this.textSize = 0,
      this.textColor = UIColors.text_colour_grey,
      this.fontWeight = FontWeight.w300,
      this.fontStyle = FontStyle.normal,
      this.textAlign = TextAlign.start,
      this.textOverflow = TextOverflow.ellipsis,
      this.maxline = 2,
      this.underline = TextDecoration.underline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      overflow: textOverflow,
      maxLines: maxline,
      style: TextStyle(
        fontFamily: "Poppins",
        fontSize: textSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: textColor,
      ),
    );
  }
}
