import 'package:flutter/material.dart';
import 'package:EmpoweringLearningEdventure/screens/wordle_screen/game_provider.dart';
import 'package:EmpoweringLearningEdventure/screens/wordle_screen/widgets/game_board.dart';
import 'package:EmpoweringLearningEdventure/screens/wordle_screen/widgets/game_keyboard.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);
  static String routeName = 'GameScreen';

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  WorldeGame _game = WorldeGame();
  late String word;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WorldeGame.initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Wordle",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          GameKeyboard(_game),
        ],
      ),
    );
  }
}
