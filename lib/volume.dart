import 'package:flutter/material.dart';

class Volume extends StatefulWidget {
  Volume({
    Key ? key,
    required this.title
  }): super(key: key);
  final String title;
  @override
  _VolumeState createState() => _VolumeState();
}

class _VolumeState extends State < Volume > {

  final _formKey = GlobalKey < FormState > ();
  final myController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController repController = TextEditingController();
  TextEditingController setController = TextEditingController();

  int total = 0;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    weightController.dispose();
    repController.dispose();
    setController.dispose();
    super.dispose();
  }

  void _calculate() {
    setState(() {
      total = (weightController.text != '' ? int.parse(weightController.text) : 0) * (repController.text != '' ? int.parse(repController.text) : 0) * (setController.text != '' ? int.parse(setController.text) : 0);
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  void _reset() {
    setState(() {
      weightController.text = '';
      repController.text = '';
      setController.text = '';
      total = 0;
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
        title: Text('Volume Calculator'),
        leading: BackButton(color: Colors.white),
      ),
      body: Container(
        // child: ,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: < Widget > [
                Text(total != 0 ? total.toString() + ' lbs' : '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          hintText: 'Weight',
                          // helperText: 'lbs',
                          counterText: 'lbs'
                        ),
                        keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                        controller: weightController,
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          final number = num.tryParse(value);
                          if (number == null) {
                            return 'Please enter a number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          hintText: 'Reps',
                          // helperText: 'lbs',
                          counterText: 'reps'
                        ),
                        keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                        controller: repController,
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          final number = num.tryParse(value);
                          if (number == null) {
                            return 'Please enter a number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          hintText: 'Sets',
                          // helperText: 'lbs',
                          counterText: 'sets'
                        ),
                        keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                        controller: setController,
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          final number = num.tryParse(value);
                          if (number == null) {
                            return 'Please enter a number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ], ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      // minWidth: 250,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Processing Data'), duration: Duration(milliseconds: 400)));
                        }
                        _calculate();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calculate,
                            color: Colors.cyan,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Text('Calculate',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20).copyWith(
                              color: Colors.cyan,
                              fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    MaterialButton(
                      // minWidth: 250,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Processing Data'), duration: Duration(milliseconds: 200)));
                        }
                        _reset();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.clear,
                            color: Colors.cyan,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Text('Reset',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20).copyWith(
                              color: Colors.cyan,
                              fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}