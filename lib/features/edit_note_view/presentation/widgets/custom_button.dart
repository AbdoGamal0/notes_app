import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonColor = theme.primaryColor;
    final textColor =
        theme.brightness == Brightness.dark ? Colors.white70 : Colors.black;
    final loaderColor =
        theme.brightness == Brightness.dark ? Colors.white70 : Colors.black54;

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: MediaQuery.sizeOf(context).width * .98,
        decoration: BoxDecoration(
          color: buttonColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(
                  color: loaderColor,
                )
              : Text(
                  'Add',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
