import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LevelButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isSelected;
  final bool beenPlayed;

  const LevelButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.isSelected,
    required this.beenPlayed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final unselectedScale = 1.0;
    final selectedScale = 1.1;
    final currentScale = isSelected ? selectedScale : unselectedScale;

    return GestureDetector(
      onTap: onTap,
      child: Transform.scale(
        scale: currentScale,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  beenPlayed ? 'assets/red_fire.png' : 'assets/blue_fire.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
