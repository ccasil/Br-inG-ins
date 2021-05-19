import 'package:flutter/material.dart';

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
  num kgtotal = 0;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void _calculate() {
    setState(() {
      total = 45 + ((fiftyfiveController.text != '' ? int.parse(fiftyfiveController.text) : 0) * 110) +
        ((fortyfiveController.text != '' ? int.parse(fortyfiveController.text) : 0) * 90) +
        ((thirtyfiveController.text != '' ? int.parse(thirtyfiveController.text) : 0) * 70) +
        ((twentyfiveController.text != '' ? int.parse(twentyfiveController.text) : 0) * 50) +
        ((fifteenController.text != '' ? int.parse(fifteenController.text) : 0) * 30) +
        ((tenController.text != '' ? int.parse(tenController.text) : 0) * 20) +
        ((fiveController.text != '' ? int.parse(fiveController.text) : 0) * 10) +
        ((twofiveController.text != '' ? int.parse(twofiveController.text) : 0) * 5);
      kgtotal = total / 2.2046;
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  void _reset() {
    setState(() {
      total = 0;
      kgtotal = 0;
      fiftyfiveController.text = '';
      fortyfiveController.text = '';
      thirtyfiveController.text = '';
      twentyfiveController.text = '';
      fifteenController.text = '';
      tenController.text = '';
      fiveController.text = '';
      twofiveController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Plate to Weight Calculator'),
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
              Expanded(child:

                Form(
                  key: _formKey,
                  child: ListView(
                    children: < Widget > [
                      TextFormField(
                        decoration: InputDecoration(
                          // icon: Icon(Icons.fitness_center),
                          // border: OutlineInputBorder(),
                          // hintText: '55s',
                          helperText: '55s'
                        ),
                        controller: fiftyfiveController,
                        validator: (value) {
                          final number = num.tryParse(fiftyfiveController.text);
                          if (number == null || value == null || value.isEmpty) {
                            fiftyfiveController.text = '';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          // icon: Icon(Icons.fitness_center),
                          // border: OutlineInputBorder(),
                          // hintText: '45s',
                          helperText: '45s'
                        ),
                        controller: fortyfiveController,
                        validator: (value) {
                          final number = num.tryParse(fortyfiveController.text);
                          if (number == null || value == null || value.isEmpty) {
                            fortyfiveController.text = '';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          // icon: Icon(Icons.fitness_center),
                          // border: OutlineInputBorder(),
                          // hintText: '35s',
                          helperText: '35s'
                        ),
                        controller: thirtyfiveController,
                        validator: (value) {
                          final number = num.tryParse(thirtyfiveController.text);
                          if (number == null || value == null || value.isEmpty) {
                            thirtyfiveController.text = '';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          // icon: Icon(Icons.fitness_center),
                          // border: OutlineInputBorder(),
                          // hintText: '25s',
                          helperText: '25s'
                        ),
                        controller: twentyfiveController,
                        validator: (value) {
                          final number = num.tryParse(twentyfiveController.text);
                          if (number == null || value == null || value.isEmpty) {
                            twentyfiveController.text = '';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          // icon: Icon(Icons.fitness_center),
                          // border: OutlineInputBorder(),
                          // hintText: '15s',
                          helperText: '15s'
                        ),
                        controller: fifteenController,
                        validator: (value) {
                          final number = num.tryParse(fifteenController.text);
                          if (number == null || value == null || value.isEmpty) {
                            fifteenController.text = '';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          // icon: Icon(Icons.fitness_center),
                          // border: OutlineInputBorder(),
                          // hintText: '10s',
                          helperText: '10s'
                        ),
                        controller: tenController,
                        validator: (value) {
                          final number = num.tryParse(tenController.text);
                          if (number == null || value == null || value.isEmpty) {
                            tenController.text = '';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          // icon: Icon(Icons.fitness_center),
                          // border: OutlineInputBorder(),
                          // hintText: '5s',
                          helperText: '5s'
                        ),
                        controller: fiveController,
                        validator: (value) {
                          final number = num.tryParse(fiveController.text);
                          if (number == null || value == null || value.isEmpty) {
                            fiveController.text = '';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          // icon: Icon(Icons.fitness_center),
                          // border: OutlineInputBorder(),
                          // hintText: '2.5s',
                          helperText: '2.5s'
                        ),
                        controller: twofiveController,
                        validator: (value) {
                          final number = num.tryParse(twofiveController.text);
                          if (number == null || value == null || value.isEmpty) {
                            twofiveController.text = '';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                      ),
                    ],
                  ),
                ),
              ),
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
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Text('Reset',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20).copyWith(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ]
              ),
              Text('lb TOTAL: ' + total.toString()),
              Text('kg TOTAL: ' + kgtotal.toStringAsFixed(2)),
            ],
          ),
        ),
      ),
    );
  }
}