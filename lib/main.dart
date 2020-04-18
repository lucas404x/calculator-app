import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:calculator/blocs/calculator_bloc.dart';
import 'package:calculator/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BlocProvider(
      blocs: [Bloc((i) => CalculatorBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Calculator",
        home: Home(),
      ),
    ));
