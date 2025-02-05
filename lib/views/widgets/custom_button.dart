import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        width: MediaQuery.sizeOf(context).width * .9,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
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
