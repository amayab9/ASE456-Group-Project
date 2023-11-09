import 'package:flutter/material.dart';
import '../ui_elements/button.dart';
import 'dart:math';

class ScientificFunctions extends StatefulWidget {
  const ScientificFunctions({Key? key}) : super(key: key);

  @override
  State<ScientificFunctions> createState() => _ScientificFunctionsState();
}

class _ScientificFunctionsState extends State<ScientificFunctions> {
  double answer = 0.0; // Represents the current value for calculations
  String display = '0';
  double num1 = 0.0;
  double num2 = 0.0; // Initialize to a default value
  String operation = '';

  // Function to update the display
  void updateDisplay(String value) {
    setState(() {
      if (display == '0' || display == 'Error') {
        display = value;
      } else {
        display += value;
      }
    });
  }

  // Function to clear the display
  void clear() {
    setState(() {
      display = '0';
      answer = 0.0;
    });
  }

  // Function to perform calculations
  void calculate() {
    try {
      final double result = double.parse(display);
      setState(() {
        display = result.toStringAsFixed(6);
        answer = result;
      });
    } catch (e) {
      setState(() {
        display = 'Error';
      });
    }
  }

  // Function to handle input (digits and decimal point)
  void handleInput(String input) {
    setState(() {
      if (answer != 0 || RegExp(r'[+\-*/0]').hasMatch(display)) {
        display = input;
        answer = 0;
      } else {
        display += input;
      }

      if (operation.isNotEmpty) {
        num2 = double.parse(display);
      }
    });
  }

  // Function to handle button clicks
  void handleClick(String input) {
    if (RegExp(r'[+\-*/0]').hasMatch(input)) {
      handleOperation(input);
    } else if (input == 'C') {
      clear();
    } else if (input == '=') {
      calculate();
    } else if (input == '√') { // Handle square root button
      calculateSquareRoot();
    } else if (input == '!') { // Handle factorial button
      calculateFactorial();
    } else {
      handleInput(input);
    }
  }

  // Function to handle mathematical operations
  void handleOperation(String op) {
    setState(() {
      if (num1 == 0.0) {
        num1 = double.parse(display);
      }
      operation = op;
      display = op.toString();
    });
  }

  // Function to calculate square root
  void calculateSquareRoot() {
    final double result = sqrt(answer);
    updateDisplay(result.toString());
  }

  // Function to calculate factorial
  void calculateFactorial() {
    if (answer < 0) {
      updateDisplay('Error');
    } else {
      int result = 1;
      for (int i = 1; i <= answer; i++) {
        result *= i;
      }
      updateDisplay(result.toString());
    }
  }

  // List of buttons
  final List buttons = [
    'C', // buttons[0]
    '√', // buttons[1]
    '!',
    '^',
    'sin',
    'cos',
    'tan',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
          height: height / 4,
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(16.0),
          child: Text(
            display,
            style: TextStyle(fontSize: 36),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: buttons.length,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: (width / height * 2),
            ),
            itemBuilder: (context, index) {
              return MyButton(
                text: buttons[index],
                buttonColor: Colors.deepPurple[100],
                textColor: Colors.black,
                function: () {
                  handleClick(buttons[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
