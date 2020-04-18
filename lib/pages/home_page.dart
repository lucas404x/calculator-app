import 'package:calculator/widgets/button/view_buttons.dart';
import 'package:calculator/widgets/output_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              OutputArea(),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: ViewButtons(),
              ),
            ],
          )),
    );
  }
}
