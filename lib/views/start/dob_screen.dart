import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:healthier_carbon_pregnancy_app/providers/create_new_user.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/about_you_screen.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_button.dart';
import 'package:provider/provider.dart';

class DOBScreen extends StatefulWidget {
  const DOBScreen({super.key});

  static const String routeName = 'dob-screen';

  @override
  State<DOBScreen> createState() => _DOBScreenState();
}

class _DOBScreenState extends State<DOBScreen> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    CreateNewUser user = Provider.of<CreateNewUser>(context);

    DateTime? selectedDate;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(height: 75),
            const Text(
              'Select your date of birth',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 75),
            //  Date Picker
            DatePickerWidget(
              looping: false, // default is not looping
              // firstDate: DateTime(2000),
              lastDate: DateTime(2003),
              //  initialDate: DateTime(2000),// DateTime(1994),
              dateFormat: "dd/MMMM/yyyy",
              locale: DatePicker.localeFromString('en'),
              onChange: (DateTime newDate, _) {
                setState(() {
                  selectedDate = newDate;
                });
                print(selectedDate);

                user.setdob(Timestamp.fromDate(selectedDate!));
              },
              pickerTheme: const DateTimePickerTheme(
                backgroundColor: Colors.transparent,
                itemTextStyle: TextStyle(color: Colors.black, fontSize: 24),
                dividerColor: Colors.black,
              ),
            ),

            const SizedBox(height: 75),

            AppButton(
              text: 'NEXT',
              onTap: () =>
                  Navigator.of(context).pushNamed(AboutYouScreen.routeName),
            ),
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
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
