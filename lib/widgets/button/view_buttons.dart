import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:calculator/blocs/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'buttons.dart';

class ViewButtons extends StatelessWidget {
  final scrollControler = ScrollController();
  final bloc = BlocProvider.getBloc<CalculatorBloc>();

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
