import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:EmpoweringLearningEdventure/screens/home_screen/home_screen.dart';
import 'package:EmpoweringLearningEdventure/screens/color_screen/game_data.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  GameData gameData = GameData();

  late Timer timer;
  int timeLeft = 10;
  int gridSize = 2;
  Color? targetColor;
  Color? dummyColor;

  Random random = Random();

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    gridSize = gameData.getGridSize();
    gameData.targetIndex = random.nextInt(pow(gridSize, 2).toInt() - 1);
    nextColor();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
          (timer) {
        if (gameData.isPlaying) {
          if (timeLeft == 0) {
            setState(() {
              timer.cancel();
            });
            endGame();
          } else {
            setState(() {
              timeLeft--;
            });
          }
        }
      },
    );
  }

  void nextLevel() {
    setState(() {
      gameData.nextLevel(timeLeft);
      gridSize = gameData.getGridSize();
      timeLeft = 10;
      timer.cancel();  // Cancel the previous timer
      startTimer();    // Start a new timer for the next level
    });
    nextColor();
  }

  void endGame() {
    setState(() {
      gameData.endGame();
      timer.cancel();  // Cancel the timer when the game ends
    });
    gameOver();
  }

  void continuePlaying() {
    setState(() {
      gameData.reset();
      gameData.score = 0;  // Reset the game data (level, score, etc.)
      gameData.isPlaying = true;
    });
    timer.cancel();  // Cancel any running timer before restarting
    startTimer();
    nextLevel();
  }

  void nextColor() {
    int r = random.nextInt(255);
    int g = random.nextInt(255);
    int b = random.nextInt(255);

    int minOffset = 6;
    int offset = 50;

    if (gridSize == 3) {
      offset = 25;
    } else if (gridSize == 4) {
      offset = 12;
    } else if (gridSize == 5) {
      offset = 6;
    }

    int rOffset = minOffset + random.nextInt(offset);
    int gOffset = minOffset + random.nextInt(offset);
    int bOffset = minOffset + random.nextInt(offset);

    if (r + rOffset > 255) rOffset = -rOffset;
    if (g + gOffset > 255) gOffset = -gOffset;
    if (b + bOffset > 255) bOffset = -bOffset;

    setState(() {
      targetColor = Color.fromRGBO(r + rOffset, g + gOffset, b + bOffset, 1.0);
      dummyColor = Color.fromRGBO(r, g, b, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Level: ${gameData.level}", style: TextStyle(fontSize: 40)),
              Text("Score: ${gameData.score}", style: TextStyle(fontSize: 30)),
              Text("Time left: $timeLeft", style: TextStyle(fontSize: 30)),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: gridSize,
                  children: List.generate(pow(gridSize, 2) as int, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          if (gameData.targetIndex == index) {
                            nextLevel();
                          } else {
                            endGame();
                          }
                        },
                        child: Ink(
                          height: 50,
                          width: 50,
                          color: gameData.targetIndex == index
                              ? targetColor
                              : dummyColor,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> gameOver() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Center(
            child: Text(
              'Game Over!',
              style: TextStyle(fontSize: 50),
            ),
          ),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, true);
                continuePlaying();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Restart ', style: TextStyle(fontSize: 30)),
                  Icon(
                    Icons.movie,
                    size: 30,
                  )
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
              child: const Center(
                child: Text('Main menu', style: TextStyle(fontSize: 30)),
              ),
            ),
          ],
        );
      },
    );
  }
}
