import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/onboarding_cubit/onboarding_cubit.dart';
import '../../../util/app_routes.dart';
import '../widget/start_game_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //size=
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: const AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.dstATop,
          ),
        )),
        child: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.15,
                      bottom: MediaQuery.of(context).size.height * 0.05),
                  child: const Text(
                      'The goal of the game is to reveal all the "bomb" cells using the clues. This game requires logical thinking, the ability to analyze and make decisions.'),
                ),
                StartGameButton(
                  onTap: () {
                    context.read<OnboardingCubit>().setFirstTime();
                    Navigator.pushReplacementNamed(context, AppRoutes.home);
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
