import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:math_expressions/math_expressions.dart';

class PctOfMax extends StatefulWidget {
  PctOfMax({
    Key ? key,
    required this.title
  }): super(key: key);
  final String title;
  @override
  _PctOfMaxState createState() => _PctOfMaxState();
}

class _PctOfMaxState extends State < PctOfMax > {

  final _formKey = GlobalKey < FormState > ();
  final myController = TextEditingController();
  String total = '';
  String kgLabel = '0';
  double _currentSliderValue = 20;

  var userInput = '';
  var answer = '';

  // Array of button
  final List < String > buttons = [
    '7',
    '8',
    '9',
    '4',
    '5',
    '6',
    '1',
    '2',
    '3',
    'c',
    '0',
    'DEL'
  ];

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  // void _calculate() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //   });
  // }

  // function to calculate the input operation
  void equalPressed() {
    String finaluserinput = userInput;
    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Percent of Max Calculator'),
        leading: BackButton(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: < Widget > [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  userInput,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.centerRight,
                  child: Text(
                    answer,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(kgLabel, textAlign: TextAlign.right, ),
                  ],
                ),
                Text(_currentSliderValue.toString()),
                Slider(
                  value: _currentSliderValue,
                  min: 0,
                  max: 100,
                  divisions: 20,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemCount: 12, primary: false , itemBuilder: (BuildContext context, int index) {
              // Clear Button
              if (index == 9) {
                return MyButton(
                  buttontapped: () {
                    setState(() {
                      print(userInput);
                      userInput = '';
                      answer = '0';
                    });
                  },
                  buttonText: buttons[index],
                  color: Colors.blue[50],
                  textColor: Colors.black,
                );
              } // Delete Button
              else if (index == 11) {
                return MyButton(
                  buttontapped: () {
                    setState(() {
                      userInput =
                        userInput.substring(0, userInput.length - 1);
                    });
                  },
                  buttonText: buttons[index],
                  color: Colors.blue[50],
                  textColor: Colors.black,
                );
              } else {
                return MyButton(
                  buttontapped: () {
                    setState(() {
                      print(buttons[index]);
                      userInput += buttons[index];
                    });
                  },
                  buttonText: buttons[index],
                  color: Colors.blue[50],
                  textColor: Colors.black,
                );
              }
            })
          ),
        ],
      ),
    );
  }
}

// creating Stateless Wideget for buttons
class MyButton extends StatelessWidget {

  // declaring variables 
  final color;
  final textColor;
  final String buttonText;
  final buttontapped;

  //Constructor
  MyButton({
    this.color,
    this.textColor,
    required this.buttonText,
    this.buttontapped
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
          child: ClipRRect(
            // borderRadius: BorderRadius.circular(25),
            child: Container(
              color: color,
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ),
    );
  }
}