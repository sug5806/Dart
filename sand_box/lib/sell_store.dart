import 'package:flutter/material.dart';

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
//  // 스토어 카테고리 리스트
//  List<String> _tabs = <String>[];
//
//  final Map<String, bool> _state = new Map<String, bool>();
//  List<Color> _colors = <Color>[Colors.white, Colors.amber];
//
//  List<Color> get colors => _colors;

  @override
  Widget build(BuildContext context) {
      return new Container(
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
      );
    }
  }


class MyCardComponent extends StatelessWidget {

  MyCardComponent({
    this.url,
    this.store_name,
    this.category,
    this.color,
    this.width,
    this.height,
    this.onPressed
  });

  final String url;
  final String store_name;
  final String category;
  final Color color;
  final double width;
  final double height;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: <Widget>[
            /*
              * 나중에 다시 씀
              */
//            Image.network(
//              url,
//              fit: BoxFit.fill,
//              width: 130.0,
//              height: 90.0,
//            ),
            Expanded(
              flex: 2,
              child: Container(
                height: height,
                width: width,
                color: color,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            store_name,
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            padding:
                            EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                            decoration: BoxDecoration(
//                                shape: ShapeBorder,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Text(
                              category,
                              style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
