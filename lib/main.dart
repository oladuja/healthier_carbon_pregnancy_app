import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/providers/about_user.dart';
import 'package:healthier_carbon_pregnancy_app/views/home/home_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/home/notification_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/home/profile_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/about_you_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/dob_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/forgot_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/health_condition.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/loading_home_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/login_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/period_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/signup_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/splash_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/continue.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/stage_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/start_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    runApp(const App());
}

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
