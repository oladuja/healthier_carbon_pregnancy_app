import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/models/about_user.dart';
import 'package:healthier_carbon_pregnancy_app/screens/home/home_screen.dart';
import 'package:healthier_carbon_pregnancy_app/screens/home/notification_screen.dart';
import 'package:healthier_carbon_pregnancy_app/screens/home/profile_screen.dart';
import 'package:healthier_carbon_pregnancy_app/screens/start/about_you_screen.dart';
import 'package:healthier_carbon_pregnancy_app/screens/start/dob_screen.dart';
import 'package:healthier_carbon_pregnancy_app/screens/start/forgot_screen.dart';
import 'package:healthier_carbon_pregnancy_app/screens/start/health_condition.dart';
import 'package:healthier_carbon_pregnancy_app/screens/start/loading_home_screen.dart';
import 'package:healthier_carbon_pregnancy_app/screens/start/login_screen.dart';
import 'package:healthier_carbon_pregnancy_app/screens/start/period_screen.dart';
import 'package:healthier_carbon_pregnancy_app/screens/start/signup_screen.dart';
import 'package:healthier_carbon_pregnancy_app/screens/start/splash_screen.dart';
import 'package:healthier_carbon_pregnancy_app/screens/start/continue.dart';
import 'package:healthier_carbon_pregnancy_app/screens/start/stage_screen.dart';
import 'package:healthier_carbon_pregnancy_app/screens/start/start_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AboutUser(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (_) => const SplashScreen(),
          HomeScreen.routeName: (_) => const HomeScreen(),
          ContinueScreen.routeName: (_) => const ContinueScreen(),
          StartScreen.routeName: (_) => const StartScreen(),
          LoginScreen.routeName: (_) => const LoginScreen(),
          SignUpScreen.routeName: (_) => const SignUpScreen(),
          StageScreen.routeName: (_) => const StageScreen(),
          DOBScreen.routeName: (_) => const DOBScreen(),
          AboutYouScreen.routeName: (_) => const AboutYouScreen(),
          HealthScreen.routeName: (_) => const HealthScreen(),
          PeriodScreen.routeName: (_) => const PeriodScreen(),
          ForgotPasswordScreen.routeName: (_) => const ForgotPasswordScreen(),
          LoadingHomeScreen.routeName: (_) => const LoadingHomeScreen(),
          ProfileScreen.routeName: (_) => const ProfileScreen(),
          NotificationScreen.routeName: (_) => const NotificationScreen(),
        },
      ),
    );
  }
}
