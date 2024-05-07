import 'package:flutter/material.dart';
import 'package:EmpoweringLearningEdventure/constants.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({Key? key}) : super(key: key);
  static String routeName = 'NoticeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOtherColor, // Using kOtherColor from constants.dart for background color
      appBar: AppBar(
        title: Text(
          'Notice Panel',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(kDefaultPadding), // Using kDefaultPadding from constants.dart for consistent padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(kDefaultPadding), // Adjust padding for better spacing
                color: kSecondaryColor, // Using kSecondaryColor from constants.dart for container color
                child: Text(
                  'Important Announcement',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: kTextWhiteColor, // Using kTextWhiteColor from constants.dart for text color
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding), // Adding space between text and image
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Applying rounded corners to the image
                  child: Image(
                    image: AssetImage('assets/images/notice.jpg'),
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover, // Making sure the image covers the container
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
