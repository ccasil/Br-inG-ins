import 'package:flutter/material.dart';
import './components.dart';

class PlateToWeight extends StatefulWidget {
  PlateToWeight({
    Key ? key,
    required this.title
  }): super(key: key);
  final String title;
  @override
  _PlateToWeightState createState() => _PlateToWeightState();
}

class _PlateToWeightState extends State < PlateToWeight > {
  int total = 45;

    @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    // myController.dispose();
    super.dispose();
  }

  void _calculate() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plate to Weight'),
        leading: BackButton(),
      ),
      body: Center(
        // child: ,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: < Widget > [
              Text('Enter the number of plates on one side of the barbell'),
              TextField(
                decoration: InputDecoration(
                  // border: OutlineInputBorder(),
                  hintText: '55s'
                ),
              ),
              MaterialButton(
                onPressed: () {
                  _calculate();
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}