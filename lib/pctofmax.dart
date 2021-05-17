import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  var lbanswer = '';
  var kganswer = '';

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

  lbkgconvert(lbkginput) {
    var number = num.tryParse(lbkginput);
    if (number == null) {
      return null;
    }
    lbanswer = (number * (_currentSliderValue / 100)).toStringAsFixed(2);
    kganswer = (number/2.2046 * (_currentSliderValue / 100)).toStringAsFixed(2);
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
                  (userInput.isEmpty)? '' : userInput + ' lbs',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.centerRight,
                  child: Text(
                    lbanswer + ' lbs',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.centerRight,
                  child: Text(
                    kganswer + ' kgs',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(kgLabel, textAlign: TextAlign.right, ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_currentSliderValue.toInt().toString() + '%', textAlign: TextAlign.right),
                  ],
                ),
                Slider(
                  value: _currentSliderValue,
                  min: 0,
                  max: 100,
                  divisions: 20,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value.floorToDouble();
                      lbkgconvert(userInput);
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemCount: 12, primary: false, itemBuilder: (BuildContext context, int index) {
              // Clear Button
              if (index == 9) {
                return MyButton(
                  buttontapped: () {
                    setState(() {
                      // print(userInput);
                      userInput = '';
                      lbanswer = '0';
                      kganswer = '0';
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
                      userInput = userInput.substring(0, userInput.length - 1);
                      lbkgconvert(userInput);
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
                      // print(buttons[index]);
                      userInput += buttons[index];
                      lbkgconvert(userInput);
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