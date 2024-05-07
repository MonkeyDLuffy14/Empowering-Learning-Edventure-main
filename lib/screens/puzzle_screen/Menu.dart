import 'package:flutter/material.dart';

import 'package:EmpoweringLearningEdventure/screens/puzzle_screen/Time.dart';
import 'package:EmpoweringLearningEdventure/screens/puzzle_screen/ResetButton.dart';
import 'package:EmpoweringLearningEdventure/screens/puzzle_screen/Move.dart';

class Menu extends StatelessWidget {

  final VoidCallback reset;
  final int move;
  final int secondsPassed;
  final Size size;

  Menu(this.reset, this.move, this.secondsPassed, this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ResetButton(reset, "Reset"),
          Move(move),
          Time(secondsPassed),
        ],
      ),
    );
  }
}
