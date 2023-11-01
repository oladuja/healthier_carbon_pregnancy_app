
import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/helper/log.dart';
import 'package:healthier_carbon_pregnancy_app/providers/create_new_user.dart';
import 'package:provider/provider.dart';

class HeightDropdown extends StatefulWidget {
  Color? color;
  HeightDropdown({super.key, this.color});

  @override
  State<HeightDropdown> createState() => _HeightDropdownState();
}

class _HeightDropdownState extends State<HeightDropdown> {
  int selectedHeight = 3;

  List<String> generateHeightsList() {
    List<String> heights = [];
    for (int feet = 3; feet <= 8; feet++) {
      for (int inches = 0; inches <= 7; inches++) {
        heights.add("$feet feet $inches inches");
      }
    }
    return heights;
  }

  @override
  Widget build(BuildContext context) {
    CreateNewUser createNewUser =
        Provider.of<CreateNewUser>(context, listen: false);

    List<String> heightList = generateHeightsList();

    // createNewUser.newUser.height = heightList[0];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Height:',
          style: TextStyle(
            fontSize: 16,
            color: widget.color ?? Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        DropdownButton<int>(
          value: selectedHeight,
          iconEnabledColor: Colors.black,
          dropdownColor: Colors.white,
          items: heightList
              .asMap()
              .entries
              .map<DropdownMenuItem<int>>(
                (MapEntry<int, String> entry) => DropdownMenuItem<int>(
                  value: entry.key,
                  child: Text(
                    entry.value,
                    style: TextStyle(
                      color: widget.color ?? Colors.black,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (int? index) {
            setState(() {
              selectedHeight = index!;
            });
            createNewUser.user.height = heightList[index!];
            logger.i(createNewUser.user.height);
          },
        ),
      ],
    );
  }
}

class WeightDropdown extends StatefulWidget {
  Color? color;

  WeightDropdown({super.key, this.color});

  @override
  State<WeightDropdown> createState() => _WeightDropdownState();
}

class _WeightDropdownState extends State<WeightDropdown> {
  int selectedWeight = 50;

  List<String> generateWeightsList() {
    List<String> weights = [];
    for (int kilograms = 50; kilograms <= 150; kilograms++) {
      weights.add("$kilograms kg");
    }
    return weights;
  }

  @override
  Widget build(BuildContext context) {
    CreateNewUser createNewUser = Provider.of<CreateNewUser>(context);

    List<String> weightList = generateWeightsList();

    // createNewUser.newUser.weight = weightList[0];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Weight:',
          style: TextStyle(
            fontSize: 16,
            color: widget.color ?? Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        DropdownButton<int>(
          value: selectedWeight,
          iconEnabledColor: Colors.black,
          dropdownColor: Colors.white,
          items: weightList
              .asMap()
              .entries
              .map<DropdownMenuItem<int>>(
                (MapEntry<int, String> entry) => DropdownMenuItem<int>(
                  value: entry.key,
                  child: Text(
                    entry.value,
                    style: TextStyle(
                      color: widget.color ?? Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (int? index) {
            setState(() {
              selectedWeight = index!;
            });
            createNewUser.user.weight = weightList[index!];
            logger.i(createNewUser.user.weight);
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
