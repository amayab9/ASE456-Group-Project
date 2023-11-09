import 'package:flutter/material.dart';
import 'dart:math';

class MyScientificFunctions extends StatefulWidget {
  @override
  _MyScientificFunctionsState createState() => _MyScientificFunctionsState();
}

class _MyScientificFunctionsState extends State<MyScientificFunctions> {
  double currentValue = 0.0; // Represents the current value for calculations
  String display = '0';

  void updateDisplay(String value) {
    setState(() {
      if (display == '0' || display == 'Error') {
        display = value;
      } else {
        display += value;
      }
    });
  }

  void clear() {
    setState(() {
      display = '0';
      currentValue = 0.0;
    });
  }

  void calculate() {
    // Parse the current display value and perform calculations
    try {
      final double result = double.parse(display);
      setState(() {
        display = result.toStringAsFixed(6);
        currentValue = result;
      });
    } catch (e) {
      setState(() {
        display = 'Error';
      });
    }
  }

  void performTrigFunction(Function(double) trigFunction) {
    final double radians = currentValue * (pi / 180); // Convert degrees to radians
    final double result = trigFunction(radians);
    updateDisplay(result.toString());
  }

  void performExponentialFunction(double Function(double) expFunction) {
    final double result = expFunction(currentValue);
    updateDisplay(result.toString());
  }

  void calculateFactorial(int n) {
    int result = 1;
    for (int i = 1; i <= n; i++) {
      result *= i;
    }
    updateDisplay(result.toString());
  }

  void calculateSquareRoot() {
    final double result = sqrt(currentValue);
    updateDisplay(result.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Scientific Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Display widget (showing the current calculation)
            Container(
              height: 80,
              width: 260,
              color: Colors.blueGrey,
              alignment: Alignment.center,
              child: Text(
                display,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),

            // Calculator buttons for trig functions, exponential, factorial, square root, etc.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Trigonometric buttons
                ElevatedButton(
                  onPressed: () {
                    performTrigFunction(sin);
                  },
                  child: Text("sin"),
                ),
                ElevatedButton(
                  onPressed: () {
                    performTrigFunction(cos);
                  },
                  child: Text("cos"),
                ),
                ElevatedButton(
                  onPressed: () {
                    performTrigFunction(tan);
                  },
                  child: Text("tan"),
                ),

                // Exponential button
                ElevatedButton(
                  onPressed: () {
                    performExponentialFunction(exp);
                  },
                  child: Text("exp"),
                ),
              ],
            ),

            // Other buttons and widgets
          ],
        ),
      ),
    );
  }
}
