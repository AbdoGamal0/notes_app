import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.maxlines, required this.hintText});
  final int? maxlines;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxlines,
      decoration: InputDecoration(
        hintText: hintText,
        border: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
        enabledBorder: buildBorder(),
      ),
      cursorColor: kPrimaryColor,
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
