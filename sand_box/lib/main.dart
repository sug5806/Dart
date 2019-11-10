import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sand_box/route.dart';
import 'sell_store.dart';

void main(){
  runApp() => MyApp();
//    ChangeNotifierProvider(
//      builder: (context) => ,
//      child: MyApp(),
//    )
//  )
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: new Container(
          color: Colors.white,
          child: new Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0),
            child: new Column(
              children: <Widget>[
                new Expanded(
                  child: new CustomScrollView(
                    slivers: <Widget>[
                      new SliverList(
                        delegate: new SliverChildListDelegate(
                          [
                            new Column(
                              children: <Widget>[
                                new Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(3, 20.0, 0, 10.0),
                                  child: new Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '연동 가능 스토어',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                new MyCardComponent(
                                  url:
                                  'http://cf.joara.com/literature_file/20190427_235346.jpg_thumb.png',
                                  store_name: 'CAFE24',
                                  category: '독립몰',
                                  color: Colors.black87,
                                  width: 130.0,
                                  height: 90.0,
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pushNamed(context, '/detail');
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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