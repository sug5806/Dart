import 'package:flutter/material.dart';
import 'import_file.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              MyHeader(),
              MyTabbar(),
              MyCategoryButton(),
            ],
          ),
        ),
      ),
    );
  }
}

// 헤더 만들기
class MyHeader extends StatefulWidget {
  @override
  _MyHeaderState createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            MyText("판매", 30.0),
            retImage(str:"http://image.dongascience.com/Photo/2018/12/2d5efe44bdd02f3e2ec4e99189d89d18.jpg", width:20.0, height:20.0)
          ],
        ),
      ),
    );
  }
}


class MyTabbar extends StatefulWidget {
  @override
  _MyTabbarState createState() => _MyTabbarState();
}

class _MyTabbarState extends State<MyTabbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            MyText("홈", 18.0),
            MyText("스토어", 18.0),
            MyText("셀러 가이드", 18.0),
            MyText("프로모션", 18.0)
          ],
        ),
      ),
    );
  }
}


class MyCategoryButton extends StatefulWidget {
  @override
  _MyCategoryButtonState createState() => _MyCategoryButtonState();
}

class _MyCategoryButtonState extends State<MyCategoryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            MyButtonTheme(54.0, 30.0, "전체", 12.0),
            MyButtonTheme(54.0, 30.0, "독립몰", 12.0),
            MyButtonTheme(54.0, 30.0, "전문몰", 12.0),
            MyButtonTheme(54.0, 30.0, "종합몰", 12.0),
            MyButtonTheme(54.0, 30.0, "오픈마켓", 12.0),
          ],
        ),
      ),
    );
  }
}
