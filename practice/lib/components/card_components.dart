import 'package:flutter/material.dart';
import 'package:practice/components/text_components.dart';

class MyCardComponent extends StatelessWidget {
  MyCardComponent({this.url, this.storeName, this.category});

  final String url;
  final String storeName;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: <Widget>[
            Image.network(
              url,
              fit: BoxFit.fill,
              width: 130.0,
              height: 90.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyText(
                          str: storeName,
                          size: 14.0,
                          bold: true,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(130, 130, 130, 1.0)),
                          ),
                          child: Text(
                            category,
                            style: TextStyle(
                                fontSize: 11.0,
                                color: Color.fromRGBO(130, 130, 130, 1.0)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Image.network(
                          'https://icon-library.net/images/connect-icon-png/connect-icon-png-1.jpg',
                          width: 16.0,
                          height: 16.0,
                        ),
                        Text(
                          "미연동",
                          style:
                              TextStyle(color: Color.fromRGBO(130, 130, 130, 1.0)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
