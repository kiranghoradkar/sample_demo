import 'package:flutter/material.dart';
import 'package:sample_demo/utils/custom_text.dart';

class Dialoug extends StatefulWidget {
  const Dialoug({Key? key}) : super(key: key);

  @override
  State<Dialoug> createState() => _DialougState();
}

class _DialougState extends State<Dialoug> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const CustomText(
        text: "Are you sure you want to delete user",
        textColor: Colors.black,
        textSize: 16,
        fontWeight: FontWeight.w500,
      ),
      actions: <Widget>[
        TextButton(
          child: const CustomText(
            text: "No",
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
            text: "Yes",
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
