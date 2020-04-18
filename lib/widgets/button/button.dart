import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:calculator/blocs/calculator_bloc.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color backgroundColor;
  final Color fontColor;
  final String text;
  final Function onPressed;
  final Function onLongPressed;

  Button(
      {@required this.backgroundColor,
      @required this.fontColor,
      @required this.text,
      this.onPressed,
      this.onLongPressed});

  final bloc = BlocProvider.getBloc<CalculatorBloc>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: FlatButton(
            onLongPress: onLongPressed,
            onPressed: onPressed,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: backgroundColor,
            child: Text(text,
                style: TextStyle(
                    color: fontColor,
                    fontFamily: "Google",
                    fontWeight: FontWeight.w300,
                    fontSize: 25))));
  }
}
