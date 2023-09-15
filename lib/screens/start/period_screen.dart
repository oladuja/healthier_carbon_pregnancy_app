import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_button.dart';

class PeriodScreen extends StatelessWidget {
  const PeriodScreen({super.key});
  static const String routeName = 'period-screen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Log the first day of your last \nperiod?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2024),
                    onDateChanged: (_) {}),
                AppButton(text: "NEXT", onTap: () {},),
                const Spacer(),
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 45),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
