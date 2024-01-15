import 'package:flutter/material.dart';

class IconMovingProgressIndicator extends StatelessWidget {
  final IconData icon;
  final double progress;
  final Color backgroundColor;
  final Color valueColor;

  const IconMovingProgressIndicator({
    Key? key,
    required this.icon,
    required this.progress,
    required this.backgroundColor,
    required this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconSize = 24; // Adjust icon size to your preference
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        LinearProgressIndicator(
          value: progress,
          backgroundColor: backgroundColor,
          valueColor: AlwaysStoppedAnimation<Color>(valueColor),
        ),
        Positioned(
            left: progress * (MediaQuery.of(context).size.width - iconSize),
            child: Image.asset(
              'assets/images/red_fire',
              height: iconSize,
            )),
      ],
    );
  }
}