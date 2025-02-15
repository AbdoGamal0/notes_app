import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({
    super.key,
    required this.iconData,
  });
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        iconData,
        size: 20,
      ),
    );
  }
}
