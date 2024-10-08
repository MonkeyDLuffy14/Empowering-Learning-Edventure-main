import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'all_words.dart';
import 'message_box.dart';

class Controller extends ChangeNotifier {
  int totalLetters = 0, lettersAnswered = 0, wordsAnswered = 0;
  bool generateWord = true, sessionCompleted = false, letterDropped = false;
  double percentCompleted = 0;
  final player = AudioPlayer();

  setUp({required int total}) {
    lettersAnswered = 0;
    totalLetters = total;
    notifyListeners();
  }

  incrementLetters({required BuildContext context}) {
    lettersAnswered++;
    updateLetterDropped(dropped: true);
    if (lettersAnswered == totalLetters) {
      player.play(AssetSource('audio/Correct_2.mp3'));
      wordsAnswered++;
      percentCompleted = wordsAnswered / allWords.length;
      if (wordsAnswered == allWords.length) {
        sessionCompleted = true;
      }
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => MessageBox(
            sessionCompleted: sessionCompleted,
          ));
    } else {
      player.play(AssetSource('audio/Correct_1.mp3'));
    }
    notifyListeners();
  }

  requestWord({required bool request}) {
    generateWord = request;
    notifyListeners();
    print('Requesting new word: $generateWord');
  }

  updateLetterDropped({required bool dropped}) {
    letterDropped = dropped;
    notifyListeners();
  }

  reset() {
    sessionCompleted = false;
    wordsAnswered = 0;
    generateWord = true;
    percentCompleted = 0;
    notifyListeners();
    print('Resetting controller. New word generation enabled.');
  }
}