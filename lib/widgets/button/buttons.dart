import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:calculator/blocs/calculator_bloc.dart';
import 'package:calculator/consts/colors.dart';
import 'package:flutter/material.dart';
import 'button.dart';

final bloc = BlocProvider.getBloc<CalculatorBloc>();

List<Widget> buttons() {
  int _operator = 0;
  List<Widget> _buttons = [];
  List<String> _operators = ["/", "*", "-", "+"];

  // add clear button

  _buttons.add(Button(
    ColorsButtons.CLEAR_COLOR,
    Colors.red,
    "C",
    onLongPressed: () {
      bloc.intText.add("ClearALL");
    },
  ));

  // add parentheses

  _buttons.add(Button(ColorsButtons.NUMBERS_COLOR, Colors.black, "("));
  _buttons.add(Button(ColorsButtons.NUMBERS_COLOR, Colors.black, ")"));

  // add numbers
  for (int i = 9; i >= 0; i--) {
    _buttons
        .add(Button(ColorsButtons.NUMBERS_COLOR, Colors.black, i.toString()));
  }

  // add math basic operators
  [3, 7, 11, 15].forEach((int index) {
    _buttons.insert(
        index,
        Button(ColorsButtons.OPERATORS_COLOR, Colors.white,
            _operators[_operator]));
    _operator++;
  });

  // add point

  _buttons.add(Button(ColorsButtons.NUMBERS_COLOR, Colors.black, "."));

  // add equal button

  _buttons.add(Button(ColorsButtons.EQUAL_OPERATOR_COLOR, Colors.white, "="));

  return _buttons;
}
