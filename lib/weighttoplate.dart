import 'package:flutter/material.dart';
import './components.dart';

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
  int fortyFiveLabel = 0;
  String thirtyFiveLabel = 'x';
  int twentyFiveLabel = 0;
  int fifteenLabel = 0;
  int tenLabel = 0;
  int fiveLabel = 0;
  int twoFiveLabel = 0;
  int temp = 0;

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
      print(myController.text);
      int input = int.parse(myController.text);
      int nobar = (input - 45) * 10;
      double halfbarbell = nobar / 2;
      temp = (halfbarbell / 450).floor();
      if (temp >= 1) {
        fortyFiveLabel = temp;
      } else {
        fortyFiveLabel = 0;
      }
      var newtotal = halfbarbell - (temp * 450);
      temp = (newtotal / 250).floor();
      if (temp >= 1) {
        twentyFiveLabel = temp;
      } else {
        twentyFiveLabel = 0;
      }
      newtotal = newtotal - (temp * 2520);
      temp = (newtotal / 150).floor();
      if (temp >= 1) {
        fifteenLabel = temp;
      } else {
        fifteenLabel = 0;
      }
      newtotal = newtotal - (temp * 150);


      temp = (newtotal / 100).floor();
      if (temp >= 1) {
        tenLabel = temp;
      } else {
        tenLabel = 0;
      }
      newtotal = newtotal - (temp * 100);


      temp = (newtotal / 50).floor();
      if (temp >= 1) {
        fiveLabel = temp;
      } else {
        fiveLabel = 0;
      }
      newtotal = newtotal - (temp * 50);


      temp = (newtotal / 25).floor();
      if (temp >= 1) {
        twoFiveLabel = temp;
      } else {
        twoFiveLabel = 0;
      }
      newtotal = newtotal - (temp * 25);

      output = '45s: ' + fortyFiveLabel.toString() + '\n35s: ' +
        thirtyFiveLabel.toString() + '\n25s: ' +
        twentyFiveLabel.toString() + '\n15s: ' +
        fifteenLabel.toString() + '\n10s: ' +
        tenLabel.toString() + '\n5s: ' +
        fiveLabel.toString() + '\n2.5s: ' +
        twoFiveLabel.toString();
      // output = myController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight to Plate'),
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
                Text('45lb Barbell'),
                TextFormField(
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    hintText: 'Enter a weight'
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
                  }
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
                Text(output),
              ],
            ),
          ),
        ),
      ),
    );
  }
}