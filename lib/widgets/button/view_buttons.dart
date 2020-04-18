import 'package:flutter/material.dart';
import 'buttons.dart';

class ViewButtons extends StatelessWidget {
  final scrollControler = ScrollController();

  @override
  Widget build(BuildContext context) {
    scrollControler.dispose();

    return GridView.count(
        crossAxisCount: 4,
        children: buttons(),
        controller: scrollControler,
        mainAxisSpacing: 2,
        padding: EdgeInsets.all(2));
  }
}
