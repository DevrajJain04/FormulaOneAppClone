
import 'package:flutter/material.dart';

class RaceSchedTile extends StatelessWidget {
  final int round;
  final String country;
  final String date;
  final String month;
  final String description;

  const RaceSchedTile(
      {super.key,
      required this.round,
      required this.country,
      required this.date,
      required this.description,
      required this.month});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
      child: ListTile(
        contentPadding: EdgeInsets.all(screenWidth * 0.02),
        leading: Column(
          children: [
            Text(
              date,
              style: TextStyle(
                  fontSize: screenWidth * 0.03, fontWeight: FontWeight.bold),
            ),
            Text(
              month,
              style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black26,
                  letterSpacing: screenWidth * 0.007),
            )
          ],
        ),
        title: Text(
          'ROUND $round $country',
          style: TextStyle(
              fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          description,
          style: TextStyle(fontSize: screenWidth * 0.035),
        ),
        
        trailing: Icon(Icons.arrow_forward_ios, size: screenWidth * 0.05),
      ),
    );
  }
}
