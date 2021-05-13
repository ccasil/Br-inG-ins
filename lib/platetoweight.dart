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
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          fiftyfiveController.text = 0.toString();
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
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
                          fortyfiveController.text = 0.toString();
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
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
                          thirtyfiveController.text = 0.toString();
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
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
                          twentyfiveController.text = 0.toString();
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
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
                          fifteenController.text = 0.toString();
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
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
                          tenController.text = 0.toString();
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
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
                          fiveController.text = 0.toString();
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
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
                          twofiveController.text = 0.toString();
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 250,
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
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
              Text('TOTAL: ' + total.toString()),
            ],
          ),
        ),
      ),
    );
  }
}