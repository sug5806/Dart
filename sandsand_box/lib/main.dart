import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.green,
      child: new Column(
        children: <Widget>[
          new RaisedButton(
            onPressed: () => Navigator.pop(context),
            child: new Text("back"),
          ),
        ],
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new FirstPageState();
}

class FirstPageState extends State<FirstPage> {

  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: color,
      child: new Column(
        children: <Widget>[
          new RaisedButton(
            child: new Text("next"),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new SecondPage()),
              )
                .then((value) {
                setState(() {
                  color = color == Colors.white ? Colors.grey : Colors.white;
                });
              });
            }),
        ],
      ),
    );
  }
}

void main() => runApp(
  new MaterialApp(
    builder: (context, child) => new SafeArea(child: child),
    home: new FirstPage(),
  ),
);