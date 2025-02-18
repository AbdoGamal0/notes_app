import 'package:flutter/material.dart';

import '../../../edit_note_view/presentation/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.icon,
      this.onTap,
      this.iconColor});
  final String title;
  final IconData icon;
  final Color? iconColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 30),
        ),
        Spacer(),
        InkWell(
          onTap: onTap,
          child: CustomSearchIcon(
            iconData: icon,
            iconColor: iconColor,
          ),
        )
      ],
    );
  }
}
