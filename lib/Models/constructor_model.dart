import 'package:flutter/material.dart';

class ConstructorData extends ChangeNotifier {
  late String name;
  late String points;

  ConstructorData({
    required this.name,
    required this.points,
  });
}
