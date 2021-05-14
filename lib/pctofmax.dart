import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Percent of Max Calculator'),
        leading: BackButton(),
      ),
      body: Center(
        // child: ,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: < Widget > [
              Text(_currentSliderValue.toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(kgLabel, textAlign: TextAlign.right, ),
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
                    _currentSliderValue = value;
                  });
                },
              ),
              // Row(
              //   children: < Widget > [
              //     CalculatorKey(symbol: Keys.seven),
              //     CalculatorKey(symbol: Keys.eight),
              //     CalculatorKey(symbol: Keys.nine),
              //   ]
              // ),
              // Row(
              //   children: < Widget > [
              //     CalculatorKey(symbol: Keys.four),
              //     CalculatorKey(symbol: Keys.five),
              //     CalculatorKey(symbol: Keys.six),
              //   ]
              // ),
              // Row(
              //   children: < Widget > [
              //     CalculatorKey(symbol: Keys.one),
              //     CalculatorKey(symbol: Keys.two),
              //     CalculatorKey(symbol: Keys.three),
              //   ]
              // ),
              // Row(
              //   children: < Widget > [
              //     CalculatorKey(symbol: Keys.zero),
              //     CalculatorKey(symbol: Keys.decimal),
              //     CalculatorKey(symbol: Keys.clear),
              //   ]
              // )
            ],
          ),
        ),
      ));
  }
}