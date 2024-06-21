import 'package:flutter/material.dart';

class RaceResultTile extends StatelessWidget {
  final String grandprix;
  final String date;
  final String description;
  final String winner;

  const RaceResultTile({
    super.key,
    required this.grandprix,
    required this.date,
    required this.description,
    required this.winner,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
      child: ListTile(
        contentPadding: EdgeInsets.all(screenWidth * 0.02),
        leading: 
            Text(
              date,
              style: TextStyle(
                  fontSize: screenWidth * 0.03, fontWeight: FontWeight.bold),
            ),
        title: Text(
          grandprix,
          style: TextStyle(
              fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          description,
          style: TextStyle(fontSize: screenWidth * 0.035),
        ),
        trailing: Row(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.02),
            child: Text(
              winner,
              style: TextStyle(fontSize: screenWidth * 0.035),
            ),
          ),
        ]),
      ),
    );
  }
}
