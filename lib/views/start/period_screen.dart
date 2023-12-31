import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/helper/fire_store.dart';
import 'package:healthier_carbon_pregnancy_app/main.dart';
import 'package:healthier_carbon_pregnancy_app/models/user.dart';
import 'package:healthier_carbon_pregnancy_app/providers/create_new_user.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/loading_home_screen.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class PeriodScreen extends StatefulWidget {
  const PeriodScreen({super.key});
  static const String routeName = 'period-screen';

  @override
  State<PeriodScreen> createState() => _PeriodScreenState();
}

class _PeriodScreenState extends State<PeriodScreen> {
  bool isLoggedInSelected = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CreateNewUser user = Provider.of<CreateNewUser>(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: FocusScope(
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Back',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Log the first day of your last \nperiod?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year),
                    lastDate: DateTime.now(),
                    onDateChanged: (date) {
                      user.setPeriod(Timestamp.fromDate(date));
                    },
                    currentDate: DateTime.now(),
                  ),
                  const SizedBox(height: 15),
                  isLoggedInSelected
                      ? Center(
                          child: LoadingAnimationWidget.staggeredDotsWave(
                            color: Colors.grey,
                            size: 45,
                          ),
                        )
                      : AppButton(
                          text: "NEXT",
                          onTap: () async {
                            FocusManager.instance.primaryFocus?.unfocus();
                            setState(() {
                              isLoggedInSelected = true;
                            });
                            try {
                              await FireStore().addUserToDatabase(
                                User(
                                  id: auth.currentUser!.uid,
                                  imageUrl: auth.currentUser!.photoURL ??
                                      'https://www.personality-insights.com/wp-content/uploads/2017/12/default-profile-pic-e1513291410505.jpg',
                                  name: auth.currentUser!.displayName ??
                                      user.user.name,
                                  email: auth.currentUser!.email ??
                                      user.user.email,
                                  stage: user.user.stage,
                                  dob: user.user.dob,
                                  height: user.user.height,
                                  weight: user.user.weight,
                                  healthCondition: user.user.healthCondition,
                                  period: user.user.period,
                                ).toJson(),
                              );
                              await prefs.setBool('isUserLoggedIn', true);
                              var data = await FireStore()
                                  .getUser(auth.currentUser!.uid);
                              user.setProfile(data.data()!);
                              Navigator.of(context)
                                  .pushNamed(LoadingHomeScreen.routeName);
                            } catch (e) {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('An error occured'),
                                ),
                              );
                              setState(() {
                                isLoggedInSelected = false;
                              });
                            }
                            setState(() {
                              isLoggedInSelected = false;
                            });
                          },
                        ),
                  // const Spacer(),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 45),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
