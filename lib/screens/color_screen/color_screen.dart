import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:EmpoweringLearningEdventure/screens/color_screen/routes.dart';

class ColorScreen extends StatelessWidget {
  ColorScreen({Key? key, this.buttonSpacing = 100.0}) : super(key: key); // Default buttonSpacing value set to 100.0
  static String routeName = 'ColorScreen';

  final double buttonSpacing; // Height of the space above the button

  final buttonStyle = ElevatedButton.styleFrom(
    padding: EdgeInsets.fromLTRB(75, 15, 75, 15), // Increased padding for the button
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ' Spot Odd Color!',
              style: TextStyle(fontSize: 48), // Reduced font size for better readability
              textAlign: TextAlign.center, // Center-align the text
            ),
            SizedBox(height: buttonSpacing), // Adds spacing above the button
            ElevatedButton(
              child: const Text('Play', style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.of(context).push(Routes.createRoute(context));
              },
              style: buttonStyle,
            ),
          ],
        ),
      ),
    );
  }
}
