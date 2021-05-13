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
  TextEditingController fiftyfiveController = TextEditingController();
  TextEditingController fortyfiveController = TextEditingController();
  TextEditingController thirtyfiveController = TextEditingController();
  TextEditingController twentyfiveController = TextEditingController();
  TextEditingController fifteenController = TextEditingController();
  TextEditingController tenController = TextEditingController();
  TextEditingController fiveController = TextEditingController();
  TextEditingController twofiveController = TextEditingController();
  num total = 0;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void _calculate() {
    setState(() {
      total = 45 + (int.parse(fiftyfiveController.text) * 110) + (int.parse(fortyfiveController.text) * 90) + (int.parse(thirtyfiveController.text) * 70) + (int.parse(twentyfiveController.text) * 50) + (int.parse(fifteenController.text) * 30) + (int.parse(tenController.text) * 20) + (int.parse(fiveController.text) * 10) + (int.parse(twofiveController.text) * 5);
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
            ],
          ),
        ),
      ),
    );
  }
}