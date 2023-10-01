import 'package:calculator_flutter/collections.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic screenText = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  screenText,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
          GridView.count(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            crossAxisCount: 4,
            children: <Widget>[
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: 'C',
                onTap: () {
                  setState(() {
                    screenText = '0';
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '( )',
                onDoubleTap: () {
                  setState(() {
                    if (!screenText.contains('(')) {
                      screenText = '$screenText ( ';
                    } else {
                      screenText = '$screenText ) ';
                    }
                  });
                },
                onLongPress: () {
                  setState(() {
                    if (!screenText.contains('(')) {
                      screenText = '$screenText ( ';
                    } else {
                      screenText = '$screenText ) ';
                    }
                  });
                },
                onTap: () {
                  setState(() {
                    screenText = '$screenText ( ';
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '%',
                onTap: () {
                  setState(() {
                    screenText = screenText * 0.01;
                  });
                },
              ),
              CalculatorButton.icon(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: 'Backspace',
                icon: Icons.backspace,
                onTap: () {
                  setState(() {
                    if (screenText == '0' ||
                        screenText == '' ||
                        screenText.length == 1) {
                      screenText = '0';
                    } else {
                      screenText =
                          screenText.substring(0, screenText.length - 1);
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '7',
                onTap: () {
                  pressNumber(7);
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '8',
                onTap: () {
                  pressNumber(8);
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '9',
                onTap: () {
                  pressNumber(9);
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '/',
                onTap: () {
                  setState(() {
                    screenText = '$screenText / ';
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '4',
                onTap: () {
                  pressNumber(4);
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '5',
                onTap: () {
                  pressNumber(5);
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '6',
                onTap: () {
                  pressNumber(6);
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: 'x',
                onTap: () {
                  setState(() {
                    screenText = '$screenText x ';
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '1',
                onTap: () {
                  pressNumber(1);
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '2',
                onTap: () {
                  pressNumber(2);
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '3',
                onTap: () {
                  pressNumber(3);
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '-',
                onTap: () {
                  setState(() {
                    screenText = '$screenText - ';
                  });
                  // TODO
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '0',
                onTap: () {
                  pressNumber(0);
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '.',
                onTap: () {
                  setState(() {
                    if (!screenText.contains('.')) {
                      screenText = '$screenText.';
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '=',
                onTap: () {
                  if (numberIncalc.isEmpty) {
                    // Handle an empty list
                    screenText = "Error";
                    return;
                  }

                  // Initialize the result with the first number in the list
                  dynamic result = numberIncalc[0];
                  bool isOperator(String str) {
                    return ['+', '-', '*', 'x', '/'].contains(str);
                  }
                  // Iterate through the list starting from the second element
                  for (int i = 1; i < numberIncalc.length; i++) {
                    dynamic element = numberIncalc[i];

                    // Check if the element is an operator (+, -, *, /, etc.)
                    if (element is String && isOperator(element)) {
                      // Handle the operator
                      switch (element) {
                        case '+':
                          result += numberIncalc[i + 1];
                          break;
                        case '-':
                          result -= numberIncalc[i + 1];
                          break;
                        case 'x':
                          result *= numberIncalc[i + 1];
                          break;
                        case '/':
                          if (numberIncalc[i + 1] != 0) {
                            result /= numberIncalc[i + 1];
                          } else {
                            screenText = "Error: Division by zero";
                            return;
                          }
                          break;
                      }

                      // Skip the next number since we've already used it in the operation
                      i++;
                    } else {
                      screenText = "Error: Invalid input";
                      return;
                    }
                  }

                  // Set the result on the screen
                  screenText = result.toString();
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '+',
                onTap: () {
                  setState(() {
                    screenText = '$screenText + ';
                  });
                  // TODO
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void pressNumber(int number) {
    setState(() {
      if (screenText == '0') {
        screenText = '$number';
      } else {
        screenText = '$screenText$number';
      }
    });
  }
}

//still working on fixin it
//ignore: must_be_immutable
class CalculatorButton extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  IconData? icon;
  final dynamic text;
  final void Function()? onTap;
  final void Function()? onDoubleTap;
  final void Function()? onLongPress;

  CalculatorButton(
      {Key? key,
      required this.backgroundColor,
      required this.foregroundColor,
      required this.text,
      this.onTap,
      this.onDoubleTap,
      this.onLongPress})
      : super(key: key);

  CalculatorButton.icon(
      {Key? key,
      required this.backgroundColor,
      required this.foregroundColor,
      this.icon,
      required this.text,
      this.onTap,
      this.onDoubleTap,
      this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      child: Container(
        color: backgroundColor,
        child: Center(
          child: icon == null
              ? Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: foregroundColor),
                )
              : Icon(
                  icon,
                  color: foregroundColor,
                ),
        ),
      ),
    );
  }
}
