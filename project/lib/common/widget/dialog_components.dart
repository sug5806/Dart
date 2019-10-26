import 'package:flutter/material.dart';

Future<void> dialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '지역을 선택해 주세요',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          content: ListView(
            children: <Widget>[
              Image.asset(
                'images/gl@3x.png',
                width: 20.0,
                height: 20.0,
              )
            ],
          ),
        );
      });
}
