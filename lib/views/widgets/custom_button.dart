import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.onPressed, this.isLoading = false});
  final VoidCallback? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: MediaQuery.sizeOf(context).width * .98,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(
                  color: Colors.black54,
                )
              : Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
