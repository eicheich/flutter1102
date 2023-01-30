import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'change-color-provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _buttonOptions = [
    RadioListValue(0, Colors.green[500]!, "Green"),
    RadioListValue(1, Colors.red, "Red"),
    RadioListValue(2, Colors.pink, "Pink"),
    RadioListValue(3, Colors.black38, "Black"),
    RadioListValue(4, Colors.yellow, "Yellow"),
    RadioListValue(5, Colors.brown, "Brown"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Consumer<ChangeColorModel>(builder: (context, model, _) {
        return Container(
          color: model.currentValue.color,
          child: ListView(
            padding: EdgeInsets.all(8.0),
            children: _buttonOptions
                .map(
                  (timeValue) => RadioListTile(
                groupValue: model.currentValue.key,
                title: Text(timeValue.label),
                value: timeValue.key,
                onChanged: (val) {
                  model.chageModel(_buttonOptions[val as int]);
                },
              ),
            )
                .toList(),
          ),
        );
      }),
    );
  }
}
