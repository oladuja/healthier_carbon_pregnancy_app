import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/providers/create_new_user.dart';
import 'package:healthier_carbon_pregnancy_app/views/home/exercise.dart';
import 'package:healthier_carbon_pregnancy_app/views/home/nutrition.dart';
import 'package:healthier_carbon_pregnancy_app/views/home/profile_screen.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_tab.dart';
import 'package:provider/provider.dart';

class WellnessScreen extends StatefulWidget {
  const WellnessScreen({super.key});

  @override
  State<WellnessScreen> createState() => _WellnessScreenState();
}

class _WellnessScreenState extends State<WellnessScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    CreateNewUser user = Provider.of<CreateNewUser>(context);

    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context)
                        .pushNamed(ProfileScreen.routeName),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(user.user.imageUrl),
                    ),
                  ),
                  // const Spacer(),
                  const SizedBox(width: 15),
                  Expanded(
                    child: SizedBox(
                      height: 38,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          fillColor: const Color(0XFF808080).withOpacity(0.1),
                          filled: true,
                          hintText: 'Type keyword',
                          hintStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          enabled: true,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(14.0),
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(14.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  child: AppTab(
                      text: "Nutrition", index: 0, selectedindex: currentIndex),
                ),
                SizedBox(
                  width: size.width / 5,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  child: AppTab(
                      text: "Exercise", index: 1, selectedindex: currentIndex),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  const Chip(
                    label: Text(
                      "Top Videos",
                      style: TextStyle(fontSize: 12),
                    ),
                    backgroundColor: Color(0XFFFEF5F3),
                    side: BorderSide(color: Colors.black),
                  ),
                  const SizedBox(width: 15),
                  const Chip(
                    label: Text(
                      "New",
                      style: TextStyle(fontSize: 12),
                    ),
                    backgroundColor: Color(0XFFFEF5F3),
                    side: BorderSide(color: Colors.black),
                  ),
                  const SizedBox(width: 15),
                  const Chip(
                    label: Text(
                      "Saved",
                      style: TextStyle(fontSize: 12),
                    ),
                    backgroundColor: Color(0XFFFEF5F3),
                    side: BorderSide(color: Colors.black),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/images/mi_filter.png',
                    height: 36,
                    width: 36,
                  )
                ],
              ),
            ),
            (currentIndex == 0) ? Nutriton(size: size) : const Exercise(),
          ],
        ),
      ),
    );
  }
}
