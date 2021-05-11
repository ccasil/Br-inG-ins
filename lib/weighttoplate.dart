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

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
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
                    }
                    return myController.text;
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
              ],
            ), )
        ),
      ),
    );
  }
}