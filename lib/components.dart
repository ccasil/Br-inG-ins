import 'package:flutter/material.dart';

class TheRouteButton extends StatelessWidget {
  final String textlabel;
  final String route;
  // final Function function; // add this
  const TheRouteButton(this.textlabel, this.route); // change this

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(50),
        color: Colors.blue,
        child: MaterialButton(
          minWidth: 250,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            Navigator.pushNamed(context, this.route);
          }, // add this here
          child: Text(textlabel,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20)
            .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}