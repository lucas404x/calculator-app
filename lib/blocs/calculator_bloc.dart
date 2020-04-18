import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:expressions/expressions.dart';

class CalculatorBloc implements BlocBase {
  final _outTextController = StreamController<String>.broadcast();
  final _textAreaController = StreamController<String>();

  Map<String, dynamic> context = {};
  String _text = "";
  Expression _expression;

  Stream<String> get outTextArea => _textAreaController.stream;
  Stream<String> get outText => _outTextController.stream;
  Sink<String> get intText => _outTextController.sink;

  CalculatorBloc() {
    outText.listen(_changeInputText);
  }

  void _changeInputText(String button) {
    // if the button pressed was "C"
    if ((button == "C" || button == "ClearALL") && _text.length > 0) {
      _text = button == "C" ? _text.substring(0, _text.length - 1) : "";
    } else if (button == "=") {
      // if the button pressed was "equal"

      try {
        _expression = Expression.parse(_text);
        _text = ExpressionEvaluator().eval(_expression, context).toString();
      } catch (e) {
        print("error: $e");
        _text = "null";
      } finally {
        _expression = null;
      }
    } else if (button != "C" && button != "ClearALL") {
      _text = _text == "0" ? button : _text + button;
    }
    _textAreaController.add(_text.length > 0 ? _text : "0");
  }

  @override
  void dispose() {
    _outTextController.close();
    _textAreaController.close();
  }

  @override
  void addListener(listener) {}

  @override
  bool get hasListeners => null;

  @override
  void notifyListeners() {}

  @override
  void removeListener(listener) {}
}
