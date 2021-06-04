import 'package:notimeforrest/template.dart';
import 'package:flutter/material.dart';
import './components.dart';
import './weighttoplate.dart';
import './platetoweight.dart';
import './pctofmax.dart';
import './pctofmaxnum.dart';
import './volume.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'notimeforrest',
      theme: ThemeData(
          primaryColor: Colors.cyan,
          primaryTextTheme: TextTheme(
            headline6: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(
            color: Colors.cyan,
          ),
        ),
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => MyHomePage(title: '', ),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/weighttoplate': (context) => WeightToPlate(title: 'Weight to Plate', ),
          '/platetoweight': (context) => PlateToWeight(title: 'Plate to Weight', ),
          // '/pctofmax': (context) => PctOfMax(title: '', ),
          '/pctofmaxnum': (context) => PctOfMaxNum(title: 'Percent of Max', ),
          '/volume': (context) => Volume(title: 'Volume', ),
        },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key ? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              TheRouteButton('Weight to Plate', '/weighttoplate'),
              TheRouteButton('Plate to Weight', '/platetoweight'),
              // TheRouteButton('% of Max', '/pctofmax'),
              TheRouteButton('% of Max Num', '/pctofmaxnum'),
              TheRouteButton('Volume', '/volume'),
          ],
        ),
      ),
    );
  }
}
