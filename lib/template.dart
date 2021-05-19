import 'package:flutter/material.dart';

class Template extends StatefulWidget {
  Template({
    Key ? key,
    required this.title
  }): super(key: key);
  final String title;
  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State < Template > {

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
        title: Text('Title'),
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
                TextFormField(
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    hintText: 'template hint',
                    // helperText: 'lbs',
                    counterText: 'counter'
                  ),
                  keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                  controller: myController,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a input';
                    }
                    final number = num.tryParse(value);
                    if (number == null) {
                      return 'Please enter a number';
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
                        .showSnackBar(SnackBar(content: Text('Processing Data'), duration: Duration(milliseconds: 600), ));
                    }
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}