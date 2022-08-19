import 'package:flutter/material.dart';
import 'package:sample_demo/utils/custom_text.dart';
import 'package:sample_demo/widget/constants.dart';

class Dialog extends StatefulWidget {
  const Dialog({Key? key}) : super(key: key);

  @override
  State<Dialog> createState() => _DialogState();
}

class _DialogState extends State<Dialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const CustomText(
        text: StringConstant.confermationMessage,
        textColor: Colors.black,
        textSize: 16,
        fontWeight: FontWeight.w500,
      ),
      actions: <Widget>[
        TextButton(
          child: const CustomText(
            text: StringConstant.no,
            textColor: Colors.black,
            textSize: 16,
            fontWeight: FontWeight.w500,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const CustomText(
            text: StringConstant.yes,
            textColor: Colors.black,
            textSize: 16,
            fontWeight: FontWeight.w500,
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        )
      ],
    );
  }
}
