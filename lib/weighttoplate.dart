import 'package:flutter/material.dart';

class WeightToPlate extends StatefulWidget {
  WeightToPlate({
    Key ? key,
    required this.title
  }): super(key: key);
  final String title;
  @override
  _WeightToPlateState createState() => _WeightToPlateState();
}

class _WeightToPlateState extends State < WeightToPlate > {

  final _formKey = GlobalKey < FormState > ();
  final myController = TextEditingController();

  int fortyFiveInt = 0;
  int thirtyFiveInt = 0;
  int twentyFiveInt = 0;
  int fifteenInt = 0;
  int tenInt = 0;
  int fiveInt = 0;
  int twoFiveInt = 0;
  int temp = 0;


  String fortyFiveLabel = '';
  String thirtyFiveLabel = '';
  String twentyFiveLabel = '';
  String fifteenLabel = '';
  String tenLabel = '';
  String fiveLabel = '';
  String twoFiveLabel = '';

  String output = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    // output.dispose();
    super.dispose();
  }

  void _calculate() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      int input = int.parse(myController.text);
      int nobar = (input - 45) * 10;
      double halftotalweight = nobar / 2;
      temp = (halftotalweight / 450).floor();
      if (temp >= 1) {
        fortyFiveInt = temp;
      } else {
        fortyFiveInt = 0;
      }
      var newtotal = halftotalweight - (temp * 450);
      print(newtotal);
      temp = (newtotal / 250).floor();
      if (temp >= 1) {
        twentyFiveInt = temp;
      } else {
        twentyFiveInt = 0;
      }
      newtotal = newtotal - (temp * 250);
      print(newtotal);
      temp = (newtotal / 150).floor();
      if (temp >= 1) {
        fifteenInt = temp;
      } else {
        fifteenInt = 0;
      }
      newtotal = newtotal - (temp * 150);
      print(newtotal);

      temp = (newtotal / 100).floor();
      if (temp >= 1) {
        tenInt = temp;
      } else {
        tenInt = 0;
      }
      newtotal = newtotal - (temp * 100);
      print(newtotal);

      temp = (newtotal / 50).floor();
      if (temp >= 1) {
        fiveInt = temp;
      } else {
        fiveInt = 0;
      }
      newtotal = newtotal - (temp * 50);


      temp = (newtotal / 25).floor();
      if (temp >= 1) {
        twoFiveInt = temp;
      } else {
        twoFiveInt = 0;
      }
      newtotal = newtotal - (temp * 25);
      print(newtotal);
      
      fortyFiveLabel = fortyFiveInt.toString() + ((fortyFiveInt > 1)?' 45s':' 45lb plate');
      thirtyFiveLabel = thirtyFiveInt.toString() + ' 35s';
      twentyFiveLabel = twentyFiveInt.toString() + ' 25s';
      fifteenLabel = fifteenInt.toString() + ' 15s';
      tenLabel = tenInt.toString() + ' 10s';
      fiveLabel = fiveInt.toString() + ' 5s';
      twoFiveLabel = twoFiveInt.toString() + ' 2.5s';
      // output = '45s: ' + fortyFiveLabel.toString() + '\n35s: ' +
      //   thirtyFiveLabel.toString() + '\n25s: ' +
      //   twentyFiveLabel.toString() + '\n15s: ' +
      //   fifteenLabel.toString() + '\n10s: ' +
      //   tenLabel.toString() + '\n5s: ' +
      //   fiveLabel.toString() + '\n2.5s: ' +
      //   twoFiveLabel.toString();
      // output = myController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight to Plate Calculator'),
        leading: BackButton(),
      ),
      body: Center(
        // child: ,
        child: Padding(
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
                  controller: myController,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a weight';
                    }
                    final number = num.tryParse(value);
                    if (number == null) {
                      return 'Please enter a number';
                    } else if (number < 45) {
                      return 'Please enter a number greater than 45';
                    }
                    _calculate();
                    return null;
                  },
                ),
                MaterialButton(
                  minWidth: 250,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Processing Data')));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calculate,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Text('Calculate',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20).copyWith(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                // Text('45lb Barbell + '),
                Text((myController.text.isEmpty)? '' : '45lb Barbell +'),
                Text((fortyFiveInt != 0)? fortyFiveLabel : ''),
                // Text((thirtyFiveInt != 0)? thirtyFiveLabel : ''),
                Text((twentyFiveInt != 0)? twentyFiveLabel : ''),
                Text((fifteenInt != 0)? fifteenLabel : ''),
                Text((tenInt != 0)? tenLabel : ''),
                Text((fiveInt != 0)? fiveLabel : ''),
                Text((twoFiveInt != 0)? twoFiveLabel : ''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}