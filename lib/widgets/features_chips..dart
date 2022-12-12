import 'package:enveu_movies/utils/constants.dart';
import 'package:flutter/material.dart';

class FeaturesChips extends StatefulWidget {
  const FeaturesChips({super.key});

  @override
  State<FeaturesChips> createState() => _GenereChipsState();
}

class _GenereChipsState extends State<FeaturesChips> {
  List<String>? selectedHobby = [];
  String selectedChoice = "";
  List<String> hobbyList = [
    '4K',
    'Sign Language',
    'Close Caption',
    'Audio Description',
    'Sopund Track',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2, left: 12, right: 12),
          child: Text(
            "Features",
            style: Theme.of(context)
                .textTheme
                .button!
                .copyWith(fontWeight: FontWeight.w900, fontSize: 22),
          ),
        ),
        const Divider(
          color: Colors.white38,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 12),
          child: Wrap(
            children: hobbyList.map(
              (hobby) {
                bool isSelected = false;
                if (selectedHobby!.contains(hobby)) {
                  isSelected = true;
                }
                return GestureDetector(
                  onTap: () {
                    if (!selectedHobby!.contains(hobby)) {
                      if (selectedHobby!.length < 5) {
                        selectedHobby!.add(hobby);
                        setState(() {});
                        print(selectedHobby);
                      } else {
                        print(selectedHobby!.length);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 700),
                          backgroundColor: Colors.black,
                          content: Text(
                            'Cannot select more than 5',
                            style: TextStyle(color: Colors.white),
                          ),
                        ));
                      }
                    } else {
                      selectedHobby!.removeWhere((element) => element == hobby);
                      setState(() {});
                      print(selectedHobby);
                    }
                  },
                  child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 12),
                        decoration: BoxDecoration(
                            color:
                                isSelected ? kPrimaryColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color: isSelected
                                    ? Colors.transparent
                                    : Colors.white38,
                                width: 2)),
                        child: Text(
                          hobby,
                          style: TextStyle(
                              color: isSelected ? Colors.black : Colors.white,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              fontSize: 15),
                        ),
                      )),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
