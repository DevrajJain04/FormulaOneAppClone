import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import '../Models/driver_model.dart';

class DriverModel extends ChangeNotifier {
  List<DriverData> driver = [];

  Future<void> getDrivers() async {
    const String url =
        'https://www.formula1.com/en/results.html/2024/drivers.html';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      dom.Document html = dom.Document.html(response.body);
      final driverName = html
          .querySelectorAll('a > span.hide-for-mobile')
          .map((element) => element.innerHtml.trim())
          .toList();
      final constructor = html
          .querySelectorAll('div > table > tbody > tr > td > a.grey')
          .map((e) => e.innerHtml.trim())
          .toList();

      driver.clear();  // Clear the list before adding new data
      for (int i = 0; i < driverName.length; i++) {
        driver.add(
          DriverData(
              name: driverName[i], constructor: constructor[i], points: '0'),
        );
      }
      notifyListeners();
    } else {
      throw Exception('Failed to load drivers');
    }
  }
}
