

import 'package:EmpoweringLearningEdventure/change_password/change_password.dart';
import 'package:EmpoweringLearningEdventure/screens/reset_password/reset_password.dart';
import 'package:EmpoweringLearningEdventure/screens/gallery_screen/gallery_screen.dart';
import 'package:EmpoweringLearningEdventure/screens/home_screen/TeacherHomeScreen.dart';
import 'package:EmpoweringLearningEdventure/screens/login_screen/login_screen.dart';
import 'package:EmpoweringLearningEdventure/screens/login_screen/teacher_login_screen.dart';
import 'package:EmpoweringLearningEdventure/screens/notice_screen/notice_screen.dart';
import 'package:EmpoweringLearningEdventure/screens/spelling_screen/spell_bee.dart';
import 'package:EmpoweringLearningEdventure/screens/quiz_screen/quiz_screen.dart';
import 'package:EmpoweringLearningEdventure/screens/puzzle_screen/puzzle_screen.dart';
import 'package:EmpoweringLearningEdventure/screens/memory_screen/memroy_screen.dart';
import 'package:EmpoweringLearningEdventure/screens/color_screen/color_screen.dart';
import 'package:EmpoweringLearningEdventure/screens/wordle_screen/game_screen.dart';
import 'package:EmpoweringLearningEdventure/screens/role_selection/role_selection.dart';
import 'package:EmpoweringLearningEdventure/screens/splash_screen/splash_screen.dart';
import 'package:EmpoweringLearningEdventure/screens/video_screen/video_screen.dart';
import 'package:flutter/cupertino.dart';
import 'screens/assignment_screen/assignment_screen.dart';
import 'screens/datesheet_screen/datesheet_screen.dart';
import 'screens/fee_screen/fee_screen.dart';
import 'screens/home_screen/home_screen.dart';
import 'screens/my_profile/my_profile.dart';

Map<String, WidgetBuilder> routes = {
  //all screens will be registered here like manifest in android
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  MyProfileScreen.routeName: (context) => MyProfileScreen(),
  FeeScreen.routeName: (context) => FeeScreen(),
  AssignmentScreen.routeName: (context) => AssignmentScreen(),
  DateSheetScreen.routeName: (context) => DateSheetScreen(),
  RoleSelection.routeName: (context) => RoleSelection(),
  TeacherLoginScreen.routeName: (context) => TeacherLoginScreen(),
  TeacherHomeScreen.routeName: (context) => TeacherHomeScreen(),
  NoticeScreen.routeName: (context) => NoticeScreen(),
  SpellBee.routeName: (context) => SpellBee(),
  GalleryScreen.routeName: (context) => GalleryScreen(),
  QuizScreen.routeName: (context) => QuizScreen(),
  PuzzleScreen.routeName: (context) => PuzzleScreen(),
  MemoryScreen.routeName: (context) => MemoryScreen(),
  ColorScreen.routeName: (context) => ColorScreen(),
  GameScreen.routeName: (context) => GameScreen(),
  VideoScreen.routeName: (context) => VideoScreen(),
  ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
  ChangePasswordScreen.routeName: (context) => ChangePasswordScreen(),
};