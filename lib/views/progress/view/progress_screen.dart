import 'package:flutter/material.dart';

import '../../../data/repository/score_repo.dart';
import '../../../util/app_routes.dart';
import '../../app/widgets/navigation_button.dart';
import '../../app/widgets/score_widget.dart';
import '../../app/widgets/start_button.dart';
import '../widget/level_button.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final int numberOfLevels = 5;
  int selectedLevelIndex = 0;

  void _onStartLevel() {
    switch (selectedLevelIndex) {
      case 0:
        if (life >= 1) {
          Navigator.of(context).pushNamed(AppRoutes.lvl);
          score -= 50;
          life -= 1;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Sorry, you\'re out of lives',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color(0xFFEAAD82),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              margin: EdgeInsets.symmetric(horizontal: 150),
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 2),
            ),
          );
        }
        break;

      case 1:
        if (life >= 1) {
          Navigator.of(context).pushNamed(AppRoutes.lvl);
          score -= 50;
          life -= 1;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Sorry, you\'re out of lives',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color(0xFFEAAD82),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              margin: EdgeInsets.symmetric(horizontal: 200),
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 2),
            ),
          );
        }
        break;
      case 2:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'This level isn\'t unlocked yet',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color(0xFFEAAD82),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 200),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
          ),
        );
        break;
      case 3:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'This level isn\'t unlocked yet',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color(0xFFEAAD82),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 200),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
          ),
        );
        break;
      case 4:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'This level isn\'t unlocked yet',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color(0xFFEAAD82),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 200),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
          ),
        );
        break;
      default:
        Navigator.of(context).pushNamed(AppRoutes.lvl);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<Offset> levelButtonPositions = [
      Offset(screenWidth * 0.15, screenHeight * 0.6),
      Offset(screenWidth * 0.325, screenHeight * 0.2),
      Offset(screenWidth * 0.5, screenHeight * 0.6),
      Offset(screenWidth * 0.65, screenHeight * 0.2),
      Offset(screenWidth * 0.85, screenHeight * 0.6),
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.02,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenHeight * 0.2,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        child: LevelButton(
                          isSelected: selectedLevelIndex == 0,
                          onTap: () {
                            setState(() {
                              selectedLevelIndex = 0;
                            });
                            _onStartLevel();
                          },
                          text: '',
                        ),
                      ),
                      Positioned(
                        child: LevelButton(
                          isSelected: selectedLevelIndex == 1,
                          onTap: () {
                            setState(() {
                              selectedLevelIndex = 1;
                            });
                            _onStartLevel();
                          },
                        ),
                      ),
                      Positioned(
                        child: LevelButton(
                          isSelected: selectedLevelIndex == 2,
                          onTap: () {
                            setState(() {
                              selectedLevelIndex = 2;
                            });
                            _onStartLevel();
                          },
                        ),
                      ),
                      Positioned(
                        child: LevelButton(
                          isSelected: selectedLevelIndex == 3,
                          onTap: () {
                            setState(() {
                              selectedLevelIndex = 3;
                            });
                            _onStartLevel();
                          },
                        ),
                      ),
                      Positioned(
                        child: LevelButton(
                          isSelected: selectedLevelIndex == 4,
                          onTap: () {
                            setState(() {
                              selectedLevelIndex = 4;
                            });
                            _onStartLevel();
                          },
                          text: '',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.1,
            left: screenWidth * 0.025,
            child: NavigationButton(
              assetName: 'assets/images/home.png',
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.home,
                );
              },
              buttonWidth: screenWidth * 0.08,
            ),
          ),
          Positioned(
            top: screenHeight * 0.035,
            right: -screenWidth * 0.025,
            child: const Column(
              children: [
                ScoreWidget(),
                //   HeartWidget(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
