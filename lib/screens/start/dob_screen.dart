import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_button.dart';

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
    DateTime? _selectedDate;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(height: 75),
            const Text(
              'Select your date of birth',
              style: TextStyle(
                fontSize: 27,
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
                  _selectedDate = newDate;
                });
                print(_selectedDate);
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
              onTap: () {},
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
