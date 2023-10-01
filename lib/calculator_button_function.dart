import 'package:flutter/material.dart';

//still working on fixin it
//ignore: must_be_immutable
class CalculatorButton extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  IconData? icon;
  final dynamic text;
  final void Function()? onTap;
  final void Function()? onDoubleTap;
  final void Function()? onLongPress;

  CalculatorButton(
      {Key? key,
        required this.backgroundColor,
        required this.foregroundColor,
        required this.text,
        this.onTap,
        this.onDoubleTap,
        this.onLongPress})
      : super(key: key);

  CalculatorButton.icon(
      {Key? key,
        required this.backgroundColor,
        required this.foregroundColor,
        this.icon,
        required this.text,
        this.onTap,
        this.onDoubleTap,
        this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      child: Container(
        color: backgroundColor,
        child: Center(
          child: icon == null
              ? Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: foregroundColor),
          )
              : Icon(
            icon,
            color: foregroundColor,
          ),
        ),
      ),
    );
  }
}