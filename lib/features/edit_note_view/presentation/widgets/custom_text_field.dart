import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.maxlines,
    required this.hintText,
    this.onSaved,
    this.onChanged,
  });

  final int? maxlines;
  final String hintText;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor =
        theme.brightness == Brightness.dark ? Colors.white54 : Colors.black54;
    final primaryColor = theme.colorScheme.primary;

    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      maxLines: maxlines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: borderColor), // تغيير لون النص حسب الثيم
        border: buildBorder(borderColor),
        focusedBorder: buildBorder(primaryColor),
        enabledBorder: buildBorder(borderColor),
      ),
      cursorColor: primaryColor,
      style: TextStyle(
          color: theme.textTheme.bodyLarge?.color), // لون الكتابة حسب الثيم
    );
  }

  OutlineInputBorder buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color),
    );
  }
}
