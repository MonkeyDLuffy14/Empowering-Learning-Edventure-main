import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:EmpoweringLearningEdventure/screens/puzzle_screen/Board.dart';

class PuzzleScreen extends StatefulWidget {
  @override
  _PuzzleScreenState createState() => _PuzzleScreenState();
  static String routeName = 'PuzzleScreen';
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    // Navigate to the Board widget directly when the screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Board()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Placeholder widget as we directly navigate to Board
    return Container();
  }
}
