import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import '../Models/constructor_model.dart';

class ConstructorModel extends ChangeNotifier {
  List<ConstructorData> constructor = [];

  Future<void> getConstructor() async {
    const String url = 'https://www.formula1.com/en/results.html/2024/team.html';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {  // Check for successful response
      dom.Document html = dom.Document.html(response.body);
      final constructorHtml = html
          .querySelectorAll('div > table > tbody > tr > td > a')
          .map((element) => element.innerHtml.trim())
          .toList();

      constructor.clear();  // Clear the list before adding new data
      for (int i = 0; i < constructorHtml.length; i++) {
        constructor.add(ConstructorData(name: constructorHtml[i], points: '0'));
      }
      notifyListeners();
    } else {
      throw Exception('Failed to load constructors');
    }
  }
}
