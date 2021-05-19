import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PctOfMaxNum extends StatefulWidget {
  PctOfMaxNum({
    Key ? key,
    required this.title
  }): super(key: key);
  final String title;
  @override
  _PctOfMaxNumState createState() => _PctOfMaxNumState();
}

class _PctOfMaxNumState extends State < PctOfMaxNum > {

  final _formKey = GlobalKey < FormState > ();
  final myController = TextEditingController();
  double _currentSliderValue = 80;

  var userInput = '';
  var lbanswer = '';
  var kganswer = '';

  @override
  void initState() {
    super.initState();

    myController.addListener(() {
      print(myController.text);
      lbkgconvert(myController.text);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  lbkgconvert(lbkginput) {
    setState(() {
      var number = num.tryParse(lbkginput);
      if (number == null) {
        lbanswer = '';
        kganswer = '';
        return null;
      }
      lbanswer = (number * (_currentSliderValue / 100)).toStringAsFixed(2);
      kganswer = (number / 2.2046 * (_currentSliderValue / 100)).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Percent of Max Calculator'),
        leading: BackButton(color: Colors.white),
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
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.centerRight,
                  child: Text(
                    lbanswer + ' lbs',
                    style: TextStyle(
                      fontSize: 18,
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
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_currentSliderValue.toInt().toString() + '%', textAlign: TextAlign.right),
                  ],
                ),
                SliderTheme(data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.cyan,
                    inactiveTrackColor: Colors.cyan[100],
                    thumbColor: Colors.cyan[600],
                    ),
                  child: Slider(
                    value: _currentSliderValue,
                    min: 0,
                    max: 100,
                    divisions: 20,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value.floorToDouble();
                        lbkgconvert(myController.text);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: < Widget > [
                        TextFormField(
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            hintText: 'Enter a weight',
                            // helperText: 'lbs',
                            counterText: 'lbs'
                          ),
                          keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
                          controller: myController,
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a weight';
                            }
                            final number = num.tryParse(value);
                            if (number == null) {
                              return 'Please enter a number';
                            }
                            userInput = number.toString();
                            lbkgconvert(number);
                            return null;
                          },
                          // onChanged: lbkgconvert(myController.text),
                        ),
                        // MaterialButton(
                        //   minWidth: 250,
                        //   padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        //   onPressed: () {
                        //     if (_formKey.currentState!.validate()) {
                        //       ScaffoldMessenger.of(context)
                        //         .showSnackBar(SnackBar(content: Text('Processing Data')));
                        //     }
                        //   },
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Icon(
                        //         Icons.calculate,
                        //         color: Colors.cyan,
                        //       ),
                        //       SizedBox(
                        //         width: MediaQuery.of(context).size.width * 0.01,
                        //       ),
                        //       Text('Calculate',
                        //         textAlign: TextAlign.center,
                        //         style: TextStyle(fontSize: 20).copyWith(
                        //           color: Colors.cyan,
                        //           fontWeight: FontWeight.bold)),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}