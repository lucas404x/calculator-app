import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:calculator/blocs/calculator_bloc.dart';
import 'package:calculator/consts/colors.dart';
import 'package:flutter/material.dart';
import 'button.dart';

final bloc = BlocProvider.getBloc<CalculatorBloc>();

List<Widget> buttons() {
  int _operator = 0;
  List<Button> _buttons = [];
  List<String> _operators = ["/", "*", "-", "+"];

  // add clear button

  _buttons.add(Button(
    backgroundColor: ColorsButtons.CLEAR_COLOR,
    fontColor: Colors.red,
    text: "C",
    onPressed: () {
      bloc.intText.add("C");
    },
    onLongPressed: () {
      bloc.intText.add("ClearALL");
    },
  ));

  // add parentheses

  _buttons.add(Button(
    backgroundColor: ColorsButtons.NUMBERS_COLOR,
    fontColor: Colors.black,
    text: "(",
    onPressed: () {
      bloc.intText.add("(");
    },
  ));

  _buttons.add(Button(
    backgroundColor: ColorsButtons.NUMBERS_COLOR,
    fontColor: Colors.black,
    text: ")",
    onPressed: () {
      bloc.intText.add(")");
    },
  ));

  // add numbers
  for (int i = 9; i >= 0; i--) {
    _buttons.add(Button(
      backgroundColor: ColorsButtons.NUMBERS_COLOR,
      fontColor: Colors.black,
      text: i.toString(),
      onPressed: () {
        bloc.intText.add(i.toString());
      },
    ));
  }

  // add math basic operators

  _buttons.insert(
      3,
      Button(
        backgroundColor: ColorsButtons.OPERATORS_COLOR,
        fontColor: Colors.white,
        text: "/",
        onPressed: () {
          bloc.intText.add("/");
        },
      ));

  _buttons.insert(
      7,
      Button(
        backgroundColor: ColorsButtons.OPERATORS_COLOR,
        fontColor: Colors.white,
        text: _operators[_operator],
        onPressed: () {
          bloc.intText.add("*");
        },
      ));

  _buttons.insert(
      11,
      Button(
        backgroundColor: ColorsButtons.OPERATORS_COLOR,
        fontColor: Colors.white,
        text: "-",
        onPressed: () {
          bloc.intText.add("-");
        },
      ));

  _buttons.insert(
      15,
      Button(
        backgroundColor: ColorsButtons.OPERATORS_COLOR,
        fontColor: Colors.white,
        text: "+",
        onPressed: () {
          bloc.intText.add("+");
        },
      ));

  // add point

  _buttons.add(Button(
    backgroundColor: ColorsButtons.NUMBERS_COLOR,
    fontColor: Colors.black,
    text: ".",
    onPressed: () {
      bloc.intText.add(".");
    },
  ));

  // add equal button

  _buttons.add(Button(
    backgroundColor: ColorsButtons.EQUAL_OPERATOR_COLOR,
    fontColor: Colors.white,
    text: "=",
    onPressed: () {
      bloc.intText.add("=");
    },
  ));

  _buttons.forEach((Button b) {
    print(b.text);
  });

  return _buttons;
}
