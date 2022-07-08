import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
 RoundedButton(
      {required this.title,
      required this.color,
      required this.onPressed,
      this.width = 200,
      this.height = 42.0,
      this.borderRadius = 30.0 ,
      this.textColor = Colors.white});

  final String title;
  final Color color;
  final Function()? onPressed;
  final double width;
  final double height;
  final double borderRadius;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: width,
          height: height,
          child: Text(
            title,style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
