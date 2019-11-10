import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlineButton(
//              color: Colors.lightBlue,
              highlightedBorderColor: Colors.yellow,
              hoverColor: Colors.purpleAccent,
              focusColor: Colors.redAccent,
              highlightElevation: 0.0,
              textColor: Colors.green,
              highlightColor: Colors.white,

              onPressed: () {},
              borderSide: BorderSide(
                width: 0.3,
                color: Colors.grey,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Text(
                'asdfsdsadfssdafsdfdsaffasdfdsaadfasda',
//                style: TextStyle(
//                  color: Colors.black,
//                  fontWeight: FontWeight.bold,
//                ),
              ),
            ),



            FlatButton(
              splashColor: Colors.white,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(
                  color: toggle? Colors.yellow : Colors.grey
                )),
              color: toggle? Colors.yellow : Colors.white,
              textColor: toggle? Colors.black : Colors.grey,
//              padding: EdgeInsets.all(8.0),
              onPressed: () {
                setState(() {
                  toggle = !toggle;
                });

              },
              child: Text(
                "t",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),

            RaisedButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red)),
              onPressed: () {},
              color: Colors.red,
              textColor: Colors.white,
              child: Text("Buy now".toUpperCase(),
                style: TextStyle(fontSize: 14)),
            ),

          ],
        ),
      ),
    );
  }
}
