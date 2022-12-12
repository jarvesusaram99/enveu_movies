import 'package:enveu_movies/utils/constants.dart';
import 'package:flutter/material.dart';

class RatingChips extends StatefulWidget {
  const RatingChips({super.key});

  @override
  State<RatingChips> createState() => _GenereChipsState();
}

class _GenereChipsState extends State<RatingChips> {
  List<String>? selectedHobby = [];
  String selectedChoice = "";
  List<String> hobbyList = ["1", "2", "3", "4", "5"];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2, left: 12, right: 12),
          child: Text(
            "Rating",
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
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              hobby,
                              style: TextStyle(
                                  color:
                                      isSelected ? Colors.black : Colors.white,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                  fontSize: 15),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.star_border_outlined,
                              color: isSelected ? Colors.black : Colors.white,
                              size: 15,
                            ),
                          ],
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
