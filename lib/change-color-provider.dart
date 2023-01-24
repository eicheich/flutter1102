import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeColorModel with ChangeNotifier {
  RadioListValue _value = new RadioListValue(0, Colors.green[500]!, "Green");
  RadioListValue get currentValue => _value;

  void chageModel(RadioListValue m) {
    _value = m;
    notifyListeners();
  }
}

class RadioListValue {
  final int key;
  final Color color;
  final String label;
  RadioListValue(this.key, this.color, this.label);
}