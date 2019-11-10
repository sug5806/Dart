import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'App Bar Title'),
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
  List itemList = [
    'Card Text 2 Line 1',
    'Card Text 2 Line 2',
    'Card Text 2 Line 3',
    'Card Text 2 Line 3',
    'Card Text 2 Line 3',
    'Card Text 2 Line 3',
    'Card Text 2 Line 3',
    'Card Text 2 Line 3',
    'Card Text 2 Line 3',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sub Title',
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 3.0,
                        ),
                      ),
                      margin: EdgeInsets.all(15.0),
                      color: Colors.grey,
                      elevation: 10.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Card 1 Text',
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 3.0,
                        ),
                      ),
                      margin: EdgeInsets.all(15.0),
                      color: Colors.grey,
                      elevation: 10.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Card 2 Header',
                                  style: TextStyle(
                                    fontSize: 25.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              itemList.length,
                                (i) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  itemList[i],
                                  style: TextStyle(
                                    fontSize: 25.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 3.0,
                        ),
                      ),
                      margin: EdgeInsets.all(15.0),
                      color: Colors.grey,
                      elevation: 10.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Card 3 Text',
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}