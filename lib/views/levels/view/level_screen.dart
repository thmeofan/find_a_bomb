import 'dart:math';

import 'package:flutter/material.dart';

import '../../../data/repository/score_repo.dart';
import '../../../util/app_routes.dart';
import '../../app/widgets/navigation_button.dart';
import '../widget/game_card_widget.dart';

class LevelScreen extends StatefulWidget {
  const LevelScreen({super.key});

  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  final String _bombIcon = 'bomb.png'; // The bomb icon asset name
  List<String?> _gameIcons = []; // Nullable String list for icons
  List<bool> _cardFlipped = []; // Track flipped state of cards

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  void _initGame() {
    setState(() {
      _gameIcons = List<String?>.filled(9, null);
      _gameIcons[Random().nextInt(_gameIcons.length)] = _bombIcon;
      _cardFlipped = List<bool>.filled(_gameIcons.length, false);
    });
  }

  void _onCardClick(int index) {
    if (_cardFlipped[index]) return;

    setState(() {
      _cardFlipped[index] = true;
    });

    if (_gameIcons[index] == _bombIcon) {
      _endGame();
    }
  }

  void _endGame() {
    if (_cardFlipped.every((bool status) => status)) {
      Navigator.of(context).pushNamed(
        AppRoutes.result,
      );
      score += 150;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _gameIcons.length,
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          return CustomCard(
            iconName: _gameIcons[index] ?? '',
            isFlipped: _cardFlipped[index],
            onTap: () => _onCardClick(index),
          );
        },
      ),
    );
  }
}
