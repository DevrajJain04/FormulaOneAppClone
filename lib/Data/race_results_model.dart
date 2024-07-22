import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

import '../Models/race_result_model.dart';

class RaceResultsModel extends ChangeNotifier {
  List<RaceResultData> raceResults = [];

  Future<void> getRaceResults() async {
    const String url =
        'https://www.formula1.com/en/results.html/2024/races.html';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      dom.Document document = parser.parse(response.body);
      final raceRows =
          document.querySelectorAll('table.resultsarchive-table tbody tr');
      document.querySelectorAll('table.resultsarchive-table tbody tr');

      raceResults.clear(); // Clear the list before adding new data

      for (dom.Element row in raceRows) {
        final grandPrix =
            row.querySelector('td.dark.bold > a')?.text.trim() ?? '';
        final date =
            row.querySelector('td.dark.hide-for-mobile')?.text.trim() ?? '';
        // Combine texts for the winner's name and abbreviation
        final winnerNameParts = row.querySelectorAll('td.dark.bold > span');
        final winner = winnerNameParts.map((e) => e.text.trim()).join(" ");
        final car =
            row.querySelector('td.semi-bold.uppercase')?.text.trim() ?? '';
        final laps =
            row.querySelector('td.bold.hide-for-mobile')?.text.trim() ?? '';
        final time =
            row.querySelector('td.dark.bold.hide-for-tablet')?.text.trim() ??
                '';

        raceResults.add(RaceResultData(
          grandPrix: grandPrix,
          date: date,
          winner: winner,
          car: car,
          laps: laps,
          time: time,
        ));
      }
      var reverser = raceResults.reversed;
      raceResults = List.from(reverser);
      notifyListeners();
    } else {
      throw Exception('Failed to load race results');
    }
  }
}
