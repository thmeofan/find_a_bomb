import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/onboarding_cubit/onboarding_cubit.dart';
import '../data/repository/onboarding_repo.dart';
import '../views/app/view/splash.dart';
import '../views/levels/view/level_screen.dart';
import '../views/onboarding/view/onboarding_screen.dart';
import '../views/progress/view/progress_screen.dart';
import '../views/result/view/result_screen.dart';
import '../views/settings/view/settings_screen.dart';

abstract class AppRoutes {
  static const home = 'home';
  static const welcome = 'welcome';
  static const menu = 'menu';
  static const result = 'result';
  static const settingsScreen = 'settings';
  static const lvl = 'lvl';
  static const progress = 'progress';
  static const splash = '/splash';
  static const onboarding = 'onboarding';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    final Widget child;

    OnboardingRepository onboardingRepository = OnboardingRepository();
    OnboardingCubit onboardingCubit = OnboardingCubit(onboardingRepository);

    switch (settings.name) {
      case onboarding:
        child = BlocProvider(
          create: (context) => onboardingCubit,
          child: OnboardingScreen(),
        );
      case home:
        child = const ProgressScreen();
      case settingsScreen:
        child = const SettingsScreen();
      case result:
        child = const ResultScreen();
      case lvl:
        child = const LevelScreen();
      case progress:
        child = const ProgressScreen();
      default:
        child = BlocProvider(
          create: (context) => onboardingCubit,
          child: SplashScreen(
            onboardingRepository: onboardingRepository,
            homeRoute: AppRoutes.home,
            onboardingRoute: AppRoutes.onboarding,
          ),
        );
    }
    return MaterialPageRoute(builder: (_) => child);
  }
}
