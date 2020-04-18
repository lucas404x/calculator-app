import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:calculator/blocs/calculator_bloc.dart';
import 'package:flutter/material.dart';

class OutputArea extends StatelessWidget {
  final _textController = TextEditingController();
  final _bloc = BlocProvider.getBloc<CalculatorBloc>();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: "0",
      stream: _bloc.outTextArea,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _textController.text = snapshot.data;
          
          return TextField(
            controller: _textController,
            textAlign: TextAlign.end,
            enabled: false,
            style: TextStyle(
              fontSize: 40,
                fontFamily: "Google",
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          );
        }

        return Container();
      },
    );
  }
}
